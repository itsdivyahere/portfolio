class CertificationModel {
  final String title;
  final String organization;
  final String year;

  const CertificationModel({
    required this.title,
    required this.organization,
    required this.year,
  });
}

class AwardModel {
  final String title;
  final String organization;
  final String year;

  const AwardModel({
    required this.title,
    required this.organization,
    required this.year,
  });
}

class CertificationsData {
  static const List<CertificationModel> certifications = [
    CertificationModel(title: 'Flutter & Dart - The Complete Guide', organization: 'Udemy', year: '2023'),
    CertificationModel(title: 'React Native Essential Training', organization: 'LinkedIn Learning', year: '2024'),
    CertificationModel(title: 'Programming Fundamentals in Kotlin', organization: 'Meta', year: '2024'),
    CertificationModel(title: 'Flutter Essential Training: Build for Multiple Platforms', organization: 'LinkedIn Learning', year: '2023'),
    CertificationModel(title: 'Front End Development in HTML', organization: 'Great Learning', year: '2024'),
  ];

  static const List<AwardModel> awards = [
    AwardModel(title: 'Certificate of Appreciation for Mobile App Developer Excellence', organization: 'Jio Platforms Limited', year: '2024'),
    AwardModel(title: 'Outstanding Performance in Flutter Development', organization: 'Jio Platforms Limited', year: '2025'),
  ];
}
