// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

Future<void> downloadFile(String assetPath, String filename) async {
  try {
    // Convert Flutter asset path to web path (assets/ becomes /assets/assets/)
    final webPath = assetPath.startsWith('assets/') 
        ? '/assets/$assetPath' 
        : assetPath;
    
    print('Attempting to download from: $webPath');
    
    // Fetch the asset file
    final response = await html.window.fetch(webPath);
    
    if (!response.ok) {
      throw Exception('Failed to fetch file: ${response.statusText}');
    }
    
    // Get the blob
    final blob = await response.blob();
    
    // Create download URL
    final url = html.Url.createObjectUrlFromBlob(blob);
    
    // Create anchor and trigger download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..style.display = 'none';
    
    html.document.body?.append(anchor);
    anchor.click();
    
    // Clean up
    await Future.delayed(const Duration(milliseconds: 100));
    anchor.remove();
    html.Url.revokeObjectUrl(url);
    
    print('Download triggered successfully');
  } catch (e) {
    print('Error downloading file: $e');
    // Fallback: try direct link without blob
    final webPath = assetPath.startsWith('assets/') 
        ? '/assets/$assetPath' 
        : assetPath;
    final anchor = html.AnchorElement(href: webPath)
      ..setAttribute('download', filename)
      ..setAttribute('target', '_blank')
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


