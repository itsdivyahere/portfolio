import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/services/resume_download_service.dart';
import '../widgets/animated_role_text.dart';
import '../widgets/app_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _handleResumeDownload(BuildContext context) async {
    try {
      final ResumeDownloadService service = ResumeDownloadService();
      
      // Download immediately (tracking happens in background)
      await service.downloadResumeAnonymously();

      // Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Resume downloaded! 📄'),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Show error message (but download probably still worked)
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Download started (tracking may have failed)'),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: ResponsiveUtils.isMobile(context) ? 600 : 700,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
          ],
        ),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: ResponsiveUtils.getMaxWidth(context)),
          padding: ResponsiveUtils.getResponsivePadding(context),
          child: ResponsiveUtils.isMobile(context)
              ? _buildMobileLayout(context)
              : ResponsiveUtils.isTablet(context)
                  ? _buildTabletLayout(context)
                  : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(context, size: 200),
        const SizedBox(height: 32),
        _buildContent(context),
        const SizedBox(height: 32),
        _buildSocialLinks(context),
        const SizedBox(height: 32),
        _buildActionButtons(context, isRow: false),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(context, size: 280),
        const SizedBox(height: 40),
        _buildContent(context),
        const SizedBox(height: 40),
        _buildSocialLinks(context),
        const SizedBox(height: 40),
        _buildActionButtons(context, isRow: true),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double avatarSize = screenWidth > 1400 ? 450 : 380;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContent(context),
              const SizedBox(height: 40),
              _buildSocialLinks(context),
              const SizedBox(height: 40),
              _buildActionButtons(context, isRow: true),
            ],
          ),
        ),
        const SizedBox(width: 80),
        Expanded(flex: 2, child: _buildAvatar(context, size: avatarSize)),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, {required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: Alignment(0, -0.8), // Slight adjustment to fit head perfectly
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
              ),
              child: Center(
                child: Icon(Icons.person, size: size * 0.6, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final bool isMobile = ResponsiveUtils.isMobile(context);
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I\'m',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.name,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        AnimatedRoleText(
          roles: const [
            'Flutter Developer',
            'Mobile App Architect',
            'Cross-Platform Expert',
          ],
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          AppConstants.professionalSummary,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    final bool isMobile = ResponsiveUtils.isMobile(context);
    
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        _buildSocialIcon(context, FontAwesomeIcons.linkedin, AppConstants.linkedInUrl, const Color(0xFF0077B5)),
        _buildSocialIcon(context, FontAwesomeIcons.github, AppConstants.githubUrl, const Color(0xFF333333)),
        _buildSocialIcon(context, FontAwesomeIcons.envelope, AppConstants.emailUrl, AppColors.error),
        _buildSocialIcon(context, FontAwesomeIcons.phone, AppConstants.phoneUrl, AppColors.accent),
      ],
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon, String url, Color color) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: FaIcon(icon, size: 24, color: color),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, {required bool isRow}) {
    return AppButton(
      onPressed: () => _handleResumeDownload(context),
      label: 'Download Resume',
      icon: Icons.download,
      isPrimary: true,
      isFullWidth: !isRow,
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
