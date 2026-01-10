import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/models/certification_model.dart';

class CertificationCard extends StatelessWidget {
  final CertificationModel certification;
  final IconData icon;

  const CertificationCard({super.key, required this.certification, required this.icon});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveUtils.isMobile(context);
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 10 : 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 5 : 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary]),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(icon, color: Colors.white, size: isMobile ? 14 : 16),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 6 : 8, vertical: isMobile ? 2 : 3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(certification.year, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: isMobile ? 10 : 11, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 6 : 10),
            Text(
              certification.title, 
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 13 : null,
              ), 
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: isMobile ? 3 : 4),
            Text(
              certification.organization, 
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: isMobile ? 11 : null,
              ), 
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
