import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
          ],
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SectionTitle(
                title: 'Get In Touch',
                subtitle: 'Feel free to reach out for collaborations or just a friendly hello',
                centerAlign: true,
              ),
              const SizedBox(height: 48),
              _buildSocialLinks(context),
              const SizedBox(height: 48),
              Text('© ${DateTime.now().year} ${AppConstants.name}. All rights reserved.', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text('Built with Flutter ❤️', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    
    return Column(
      children: [
        Text('Connect with me', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _buildSocialButton(context, FontAwesomeIcons.linkedin, AppConstants.linkedInUrl, const Color(0xFF0077B5)),
            _buildSocialButton(context, FontAwesomeIcons.github, AppConstants.githubUrl, const Color(0xFF333333)),
            _buildSocialButton(context, FontAwesomeIcons.envelope, AppConstants.emailUrl, AppColors.error),
            _buildSocialButton(context, FontAwesomeIcons.phone, AppConstants.phoneUrl, AppColors.accent),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon, String url, Color color) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8, spreadRadius: 1)],
        ),
        child: FaIcon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
