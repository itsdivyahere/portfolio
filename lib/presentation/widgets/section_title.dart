import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool centerAlign;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.centerAlign = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveUtils.isMobile(context);
    final bool shouldCenter = centerAlign || isMobile;

    return Column(
      crossAxisAlignment: shouldCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: shouldCenter ? TextAlign.center : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: shouldCenter ? TextAlign.center : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
