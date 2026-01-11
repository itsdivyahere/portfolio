// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

Future<void> downloadFile(String assetPath, String filename) async {
  // Simple direct download - convert Flutter asset path to web path
  final webPath = assetPath.startsWith('assets/') 
      ? '/assets/$assetPath' 
      : assetPath;
  
  // Create anchor element with direct link
  final anchor = html.AnchorElement(href: webPath)
    ..setAttribute('download', filename)
    ..click();
}

String getDeviceInfo() {
  return html.window.navigator.userAgent;
}

String getBrowserInfo() {
  final String userAgent = html.window.navigator.userAgent;
  if (userAgent.contains('Chrome')) return 'Chrome';
  if (userAgent.contains('Firefox')) return 'Firefox';
  if (userAgent.contains('Safari')) return 'Safari';
  if (userAgent.contains('Edge')) return 'Edge';
  return 'Unknown Browser';
}


