import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/models/certification_model.dart';
import '../widgets/section_title.dart';
import '../widgets/certification_card.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: ResponsiveUtils.getMaxWidth(context)),
          padding: ResponsiveUtils.getResponsivePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Certifications & Awards', subtitle: 'Professional certifications and recognitions'),
              const SizedBox(height: 16),
              Text('Certifications', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveUtils.getCrossAxisCount(context),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: ResponsiveUtils.isMobile(context) ? 2.2 : 1.9,
                ),
                itemCount: CertificationsData.certifications.length,
                itemBuilder: (context, index) => CertificationCard(certification: CertificationsData.certifications[index], icon: Icons.school),
              ),
              const SizedBox(height: 24),
              Text('Awards & Recognition', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveUtils.getCrossAxisCount(context),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: ResponsiveUtils.isMobile(context) ? 2.2 : 1.9,
                ),
                itemCount: CertificationsData.awards.length,
                itemBuilder: (context, index) {
                  final award = CertificationsData.awards[index];
                  return CertificationCard(
                    certification: CertificationModel(title: award.title, organization: award.organization, year: award.year),
                    icon: Icons.emoji_events,
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
