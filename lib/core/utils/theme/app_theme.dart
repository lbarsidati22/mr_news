import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class AppTheme {
  static ThemeData get mainTheme => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.grey9,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.appbackgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          backgroundColor: AppColors.appbackgroundColor,
        ),

        fontFamily: 'OpenSans',
        // colorScheme: AppColors.primary,
        useMaterial3: true,
      );
}
