import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/download_tracking_model.dart';
import 'download_helper.dart' as download_helper;

class ResumeDownloadService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collectionName = 'resume_downloads';

  /// Download resume with anonymous tracking (no sign-in required)
  Future<void> downloadResumeAnonymously() async {
    try {
      // Get device and browser info
      final String deviceInfo = download_helper.getDeviceInfo();
      final String browserInfo = download_helper.getBrowserInfo();
      
      // Get IP address (for location approximation)
      final String ipAddress = await _getIpAddress();
      
      // Create anonymous tracking model
      final DownloadTrackingModel trackingData = DownloadTrackingModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userName: 'Anonymous User',
        userEmail: 'anonymous@download',
        userPhone: 'Not collected',
        ipAddress: ipAddress,
        deviceInfo: deviceInfo,
        browserInfo: browserInfo,
        downloadedAt: DateTime.now(),
        location: 'Unknown', // Could use IP geolocation service if needed
      );

      // Save to Firestore (non-blocking, don't wait)
      _saveDownloadTracking(trackingData).catchError((e) {
        if (kDebugMode) {
          print('Error saving tracking (non-critical): $e');
        }
      });

      // Trigger resume download immediately (don't wait for tracking to complete)
      download_helper.downloadFile(
        'assets/resume/Divya_Pawar_Resume.pdf',
        'Divya_Pawar_Resume.pdf',
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading resume: $e');
      }
      // Still try to download even if tracking fails
      download_helper.downloadFile(
        'assets/resume/Divya_Pawar_Resume.pdf',
        'Divya_Pawar_Resume.pdf',
      );
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

