import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/models/skill_model.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ResponsiveUtils.getResponsivePadding(context),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: ResponsiveUtils.getMaxWidth(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'About Me', subtitle: 'Get to know more about my skills and experience'),
              const SizedBox(height: 16),
              _buildExperienceCards(context),
              const SizedBox(height: 24),
              _buildSkillsSection(context),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCards(BuildContext context) {
    final int crossAxisCount = ResponsiveUtils.getCrossAxisCount(context);
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: ResponsiveUtils.isMobile(context) ? 1.8 : 1.5,
      children: [
        _buildExperienceCard(context, Icons.work, '3+ Years', 'Experience', AppColors.primaryGradient),
        _buildExperienceCard(context, Icons.apps, '50,000+', 'Active Users', AppColors.accentGradient),
        _buildExperienceCard(context, Icons.code, '10+', 'Major Modules', const LinearGradient(colors: [AppColors.secondary, AppColors.accentOrange], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ],
    );
  }

  Widget _buildExperienceCard(BuildContext context, IconData icon, String title, String subtitle, Gradient gradient) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient.colors.map((c) => c.withOpacity(0.1)).toList(), begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(gradient: gradient, shape: BoxShape.circle),
              child: Icon(icon, size: 24, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Technical Skills', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.getCrossAxisCount(context),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: ResponsiveUtils.isMobile(context) ? 1.8 : 1.5,
          ),
          itemCount: SkillsData.skills.length,
          itemBuilder: (context, index) => SkillCard(skill: SkillsData.skills[index]),
        ),
      ],
    );
  }
}
