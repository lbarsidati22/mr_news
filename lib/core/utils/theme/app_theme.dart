import 'package:flutter/material.dart';
import 'package:mr_news/core/utils/theme/app_colors.dart';

class AppTheme {
  static ThemeData get mainTheme => ThemeData(
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
