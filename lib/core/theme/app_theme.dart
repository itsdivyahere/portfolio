import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.cardLight,
        background: AppColors.backgroundLight,
        error: AppColors.error,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        displayMedium: GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        displaySmall: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        headlineMedium: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        headlineSmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: AppColors.textPrimaryLight),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: AppColors.textSecondaryLight),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
