import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final bool isPrimary;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.isPrimary = true,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 48.0;
    const double minWidth = 160.0;

    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18),
          const SizedBox(width: 8),
        ],
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );

    final buttonStyle = isPrimary
        ? ElevatedButton.styleFrom(
            minimumSize: Size(minWidth, height),
            padding: const EdgeInsets.symmetric(horizontal: 24),
          )
        : OutlinedButton.styleFrom(
            minimumSize: Size(minWidth, height),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          );

    final button = isPrimary
        ? ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: buttonContent,
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: buttonContent,
          );

    return isFullWidth
        ? SizedBox(width: double.infinity, height: height, child: button)
        : SizedBox(height: height, child: button);
  }
}


