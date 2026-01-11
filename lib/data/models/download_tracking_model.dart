import 'package:cloud_firestore/cloud_firestore.dart';

class DownloadTrackingModel {
  final String id;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String ipAddress;
  final String deviceInfo;
  final String browserInfo;
  final DateTime downloadedAt;
  final String location;

  DownloadTrackingModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.ipAddress,
    required this.deviceInfo,
    required this.browserInfo,
    required this.downloadedAt,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'ipAddress': ipAddress,
      'deviceInfo': deviceInfo,
      'browserInfo': browserInfo,
      'downloadedAt': Timestamp.fromDate(downloadedAt),
      'location': location,
    };
  }

  factory DownloadTrackingModel.fromJson(Map<String, dynamic> json) {
    return DownloadTrackingModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      userPhone: json['userPhone'] as String,
      ipAddress: json['ipAddress'] as String,
      deviceInfo: json['deviceInfo'] as String,
      browserInfo: json['browserInfo'] as String,
      downloadedAt: (json['downloadedAt'] as Timestamp).toDate(),
      location: json['location'] as String,
    );
  }

  factory DownloadTrackingModel.empty() {
    return DownloadTrackingModel(
      id: '',
      userName: '',
      userEmail: '',
      userPhone: '',
      ipAddress: '',
      deviceInfo: '',
      browserInfo: '',
      downloadedAt: DateTime.now(),
      location: '',
    );
  }
}


