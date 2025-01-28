import 'package:calendar_view/calendar_view.dart';
import 'package:example/constants.dart';
import 'package:example/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'dark_app_colors.dart';

class AppTheme {
  // Base InputDecorationTheme
  static final baseInputDecorationTheme = InputDecorationTheme(
    border: AppConstants.inputBorder,
    disabledBorder: AppConstants.inputBorder,
    errorBorder: AppConstants.inputBorder.copyWith(
      borderSide: BorderSide(
        width: 2,
        color: AppColors.red,
      ),
    ),
    enabledBorder: AppConstants.inputBorder,
    focusedBorder: AppConstants.inputBorder.copyWith(
      borderSide: BorderSide(
        width: 2,
        color: AppColors.outline,
      ),
    ),
    focusedErrorBorder: AppConstants.inputBorder,
    hintStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
    ),
    labelStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
    ),
    helperStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
    ),
    errorStyle: TextStyle(
      color: AppColors.red,
      fontSize: 12,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
  );

  // Light theme
  static final light = CalendarTheme.light.copyWith(
      // TODO(Shubham): Reorder
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      inputDecorationTheme: baseInputDecorationTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateColor.resolveWith(
          (_) => AppColors.primary,
        ),
      ),
      extensions: [_lightAppColors]);

  static final _lightAppColors = CalendarThemeExtension().copyWith();

  // Dark theme
  static final dark = CalendarTheme.dark.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: DarkAppColors.primary,
      foregroundColor: DarkAppColors.onPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkAppColors.primary,
        foregroundColor: DarkAppColors.onPrimary,
      ),
    ),
    inputDecorationTheme: baseInputDecorationTheme.copyWith(
      disabledBorder: AppConstants.inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: DarkAppColors.outlineVariant,
        ),
      ),
      enabledBorder: AppConstants.inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: DarkAppColors.outlineVariant,
        ),
      ),
      focusedBorder: AppConstants.inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: DarkAppColors.outline,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: DarkAppColors.primary,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (_) => DarkAppColors.primary,
      ),
    ),
  );
}
