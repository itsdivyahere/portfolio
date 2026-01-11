// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadFile(String assetPath, String filename) async {
  try {
    // Fetch the asset file as bytes
    final response = await html.window.fetch(assetPath);
    final blob = await response.blob();
    
    // Create a temporary URL for the blob
    final url = html.Url.createObjectUrlFromBlob(blob);
    
    // Create anchor element and trigger download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..style.display = 'none';
    
    html.document.body?.append(anchor);
    anchor.click();
    
    // Clean up
    anchor.remove();
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    print('Error downloading file: $e');
    // Fallback: try direct link
    final anchor = html.AnchorElement(href: assetPath)
      ..setAttribute('download', filename)
      ..click();
  }
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


