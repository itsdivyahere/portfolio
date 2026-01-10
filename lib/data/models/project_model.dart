class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String duration;
  final bool isFeatured;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    required this.duration,
    this.isFeatured = false,
  });
}

class ProjectsData {
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'PeopleFirst - Enterprise HR Application',
      description: 'Built for employee engagement and HR management across all Reliance employees globally. Enterprise-grade Flutter application for 50,000+ RIL employees with 296K+ installs on Android.',
      technologies: ['Flutter', 'Dart', 'Kotlin', 'Riverpod', 'BLoC', 'GetX', 'REST APIs', 'Firebase'],
      features: [
        'Led development team ensuring 100% on-time delivery',
        'Optimized apps improving performance by 30%',
        'Built HR modules: Approvals, Payroll, PMS, Benefits',
        'Travel Management with Thomas Cook API',
        'Campus Exploration with RSports, CRBS',
        'Offline-first architecture',
        'Firebase & CleverTap integration',
        'Biometric authentication with OAuth 2.0',
      ],
      duration: '2023 - Present',
      isFeatured: true,
    ),
    ProjectModel(
      title: 'NiyantranPro - AI Productivity Application',
      description: 'AI-powered productivity app combining task management, calendar scheduling, note-taking, and document scanning with OCR.',
      technologies: ['Flutter', 'Dart', 'GetX', 'Google ML Kit', 'GoRouter'],
      features: [
        'Time-based animated backgrounds',
        'Task Management with prioritization',
        'Calendar System with event CRUD',
        'Notes with voice-to-text',
        'Document Scanner with OCR',
        'GetX reducing boilerplate by 30%',
      ],
      duration: '2025',
      isFeatured: true,
    ),
  ];
}
