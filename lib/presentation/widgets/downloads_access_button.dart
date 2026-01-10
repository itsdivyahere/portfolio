import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../pages/downloads_tracking_page.dart';

/// Widget to provide access to download analytics
/// Can be used in various locations throughout the app
class DownloadsAccessButton extends StatelessWidget {
  final ButtonStyle? style;
  final bool showLabel;

  const DownloadsAccessButton({
    super.key,
    this.style,
    this.showLabel = true,
  });

  void _navigateToDownloads(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DownloadsTrackingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLabel) {
      return ElevatedButton.icon(
        onPressed: () => _navigateToDownloads(context),
        icon: const Icon(Icons.analytics),
        label: const Text('View Downloads'),
        style: style,
      );
    } else {
      return IconButton(
        onPressed: () => _navigateToDownloads(context),
        icon: const Icon(Icons.analytics),
        tooltip: 'View Download Analytics',
      );
    }
  }
}

/// Floating action button for downloads access
class DownloadsFloatingButton extends StatelessWidget {
  const DownloadsFloatingButton({super.key});

  void _navigateToDownloads(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DownloadsTrackingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _navigateToDownloads(context),
      icon: const Icon(Icons.analytics),
      label: const Text('Downloads'),
      backgroundColor: AppColors.primary,
      tooltip: 'View Resume Downloads',
    );
  }
}

/// App bar action for downloads access
class DownloadsAppBarAction extends StatelessWidget {
  const DownloadsAppBarAction({super.key});

  void _navigateToDownloads(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DownloadsTrackingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _navigateToDownloads(context),
      icon: const Icon(Icons.analytics),
      tooltip: 'View Download Analytics',
    );
  }
}

