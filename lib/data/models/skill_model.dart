class SkillModel {
  final String category;
  final List<String> skills;

  const SkillModel({required this.category, required this.skills});
}

class SkillsData {
  static const List<SkillModel> skills = [
    SkillModel(category: 'Mobile Development', skills: ['Flutter', 'Dart', 'Android Development', 'iOS Development', 'Cross-Platform Development', 'Mobile UI/UX']),
    SkillModel(category: 'State Management', skills: ['BLoC Pattern', 'GetX', 'Provider', 'Riverpod', 'Cubit']),
    SkillModel(category: 'Backend Integration', skills: ['REST APIs', 'GraphQL', 'HTTP Client', 'Dio', 'JSON Parsing', 'API Authentication']),
    SkillModel(category: 'Database', skills: ['SQLite', 'Hive Database', 'GetStorage', 'SharedPreferences', 'Firebase Firestore', 'FlutterSecureStorage']),
    SkillModel(category: 'Firebase Services', skills: ['Authentication', 'Cloud Messaging', 'Analytics', 'Crashlytics', 'Remote Config', 'Performance Monitoring']),
    SkillModel(category: 'Architecture', skills: ['MVVM', 'Clean Architecture', 'Repository Pattern', 'Dependency Injection', 'Modular Development']),
    SkillModel(category: 'Tools & Platforms', skills: ['Android Studio', 'VS Code', 'Xcode', 'Git', 'GitHub', 'Firebase Console', 'Postman']),
    SkillModel(category: 'AI Development Tools', skills: ['Cursor AI', 'GitHub Copilot', 'ChatGPT', 'AI-assisted Code Generation', 'Automated Testing']),
  ];
}
