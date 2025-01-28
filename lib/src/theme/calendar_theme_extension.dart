import 'package:flutter/material.dart';

import 'light_app_colors.dart';

// Default theme is light theme
class CalendarThemeExtension extends ThemeExtension<CalendarThemeExtension> {
  CalendarThemeExtension({
    this.primary = LightAppColors.primary,
    this.onPrimary = LightAppColors.onPrimary,
    this.onPrimaryContainer = LightAppColors.onPrimaryContainer,
    this.onSecondaryContainer = LightAppColors.onSecondaryContainer,
    this.surfaceContainerHigh = LightAppColors.surfaceContainerHigh,
    this.secondaryContainer = LightAppColors.secondaryContainer,
    this.outlineVariant = LightAppColors.outlineVariant,
    this.onSurface = LightAppColors.onSurface,
  });

  final Color primary;
  final Color onPrimary;
  final Color onPrimaryContainer;
  final Color onSecondaryContainer;
  final Color surfaceContainerHigh;
  final Color secondaryContainer;
  final Color outlineVariant;
  final Color onSurface;

  @override
  ThemeExtension<CalendarThemeExtension> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? surfaceContainerHigh,
  }) {
    return CalendarThemeExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
    );
  }

  @override
  ThemeExtension<CalendarThemeExtension> lerp(
    covariant ThemeExtension<CalendarThemeExtension>? other,
    double t,
  ) {
    // TODO(Shubham): Update this
    return this;
  }
}
