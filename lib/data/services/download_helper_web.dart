// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadFile(String url, String filename) {
  final anchor = html.AnchorElement(href: url)
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

