import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_utils.dart';

class PortfolioHeader extends StatelessWidget {
  final Function(int) onMenuItemTap;
  final int currentSection;

  const PortfolioHeader({
    super.key,
    required this.onMenuItemTap,
    this.currentSection = 0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveUtils.isMobile(context);
    final double topPadding = MediaQuery.of(context).padding.top;
    
    return Container(
      margin: EdgeInsets.only(top: topPadding),
      height: 60,
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(context),
              if (isMobile)
                _buildMobileMenu(context)
              else
                _buildDesktopMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return InkWell(
      onTap: () => onMenuItemTap(0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'DP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            AppConstants.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      children: [
        _buildMenuItem(context, 'Home', 0),
        const SizedBox(width: 32),
        _buildMenuItem(context, 'About', 1),
        const SizedBox(width: 32),
        _buildMenuItem(context, 'Projects', 2),
        const SizedBox(width: 32),
        _buildMenuItem(context, 'Certifications', 3),
        const SizedBox(width: 32),
        _buildMenuItem(context, 'Contact', 4),
      ],
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: AppColors.primary),
      onSelected: onMenuItemTap,
      itemBuilder: (context) => [
        _buildPopupMenuItem('Home', 0),
        _buildPopupMenuItem('About', 1),
        _buildPopupMenuItem('Projects', 2),
        _buildPopupMenuItem('Certifications', 3),
        _buildPopupMenuItem('Contact', 4),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, int index) {
    final bool isActive = currentSection == index;
    
    return InkWell(
      onTap: () => onMenuItemTap(index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? AppColors.primary : Colors.grey[700],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(String title, int index) {
    final bool isActive = currentSection == index;
    
    return PopupMenuItem<int>(
      value: index,
      child: Row(
        children: [
          if (isActive)
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          if (isActive) const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppColors.primary : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

