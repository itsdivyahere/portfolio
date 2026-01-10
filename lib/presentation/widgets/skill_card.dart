import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/models/skill_model.dart';

class SkillCard extends StatelessWidget {
  final SkillModel skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveUtils.isMobile(context);
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 10 : 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 5 : 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.code, color: Theme.of(context).colorScheme.primary, size: isMobile ? 14 : 16),
                ),
                SizedBox(width: isMobile ? 6 : 8),
                Expanded(
                  child: Text(
                    skill.category,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 13 : null,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 6 : 8),
            Wrap(
              spacing: isMobile ? 3 : 4,
              runSpacing: isMobile ? 3 : 4,
              children: skill.skills.map((skillName) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 6 : 8,
                    vertical: isMobile ? 3 : 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    skillName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: isMobile ? 10 : 11,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
