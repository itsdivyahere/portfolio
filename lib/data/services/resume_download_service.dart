import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/download_tracking_model.dart';
import 'auth_service.dart';
import 'download_helper.dart' as download_helper;

class ResumeDownloadService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();
  static const String _collectionName = 'resume_downloads';

  Future<void> downloadResumeWithGoogleSignIn() async {
    try {
      // Sign in with Google
      final userCredential = await _authService.signInWithGoogle();
      
      if (userCredential == null || userCredential.user == null) {
        throw Exception('Sign-in cancelled or failed');
      }

      final User user = userCredential.user!;
      
      // Get user information from Google account
      final String userName = user.displayName ?? 'Unknown';
      final String userEmail = user.email ?? 'Unknown';
      final String userPhone = user.phoneNumber ?? 'Not provided';
      
      // Get device and browser info
      final String deviceInfo = download_helper.getDeviceInfo();
      final String browserInfo = download_helper.getBrowserInfo();
      
      // Get IP address
      final String ipAddress = await _getIpAddress();
      
      // Create tracking model
      final DownloadTrackingModel trackingData = DownloadTrackingModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userName: userName,
        userEmail: userEmail,
        userPhone: userPhone,
        ipAddress: ipAddress,
        deviceInfo: deviceInfo,
        browserInfo: browserInfo,
        downloadedAt: DateTime.now(),
        location: 'Unknown',
      );

      // Save to Firestore
      await _saveDownloadTracking(trackingData);

      // Trigger resume download
      download_helper.downloadFile(
        'assets/resume/Divya_Pawar_Resume.pdf',
        'Divya_Pawar_Resume.pdf',
      );
      
      // Sign out after download (optional)
      await _authService.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading resume: $e');
      }
      rethrow;
    }
  }

  Future<void> _saveDownloadTracking(DownloadTrackingModel trackingData) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(trackingData.id)
          .set(trackingData.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error saving download tracking: $e');
      }
      rethrow;
    }
  }

  Future<String> _getIpAddress() async {
    try {
      return 'Unknown';
    } catch (e) {
      return 'Unknown';
    }
  }

  Future<List<DownloadTrackingModel>> fetchAllDownloads() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection(_collectionName)
          .orderBy('downloadedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => DownloadTrackingModel.fromJson(
              doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching downloads: $e');
      }
      return [];
    }
  }

  Stream<List<DownloadTrackingModel>> streamDownloads() {
    return _firestore
        .collection(_collectionName)
        .orderBy('downloadedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => DownloadTrackingModel.fromJson(
                doc.data()))
            .toList());
  }
}

