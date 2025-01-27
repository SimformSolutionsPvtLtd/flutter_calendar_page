import 'package:flutter/material.dart';

import 'light_app_colors.dart';

class WeekViewTheme extends ThemeExtension<WeekViewTheme> {
  /// Default is light theme
  WeekViewTheme({
    this.weekDayTile = LightAppColors.surfaceContainerHigh,
    this.weekDayText = LightAppColors.onSurface,
    this.weekDayBorder = LightAppColors.outlineVariant,
    this.pageBackground = LightAppColors.surfaceContainerLowest,
    this.hourLine = LightAppColors.surfaceContainerHighest,
    this.halfHourLine = LightAppColors.surfaceContainerHighest,
    this.quarterHourLine = LightAppColors.surfaceContainerHighest,
  });

  /// Weekday tile color
  final Color weekDayTile;
  final Color weekDayText;
  final Color weekDayBorder;
  final Color pageBackground;
  final Color hourLine;
  final Color halfHourLine;
  final Color quarterHourLine;

  @override
  ThemeExtension<WeekViewTheme> copyWith({
    Color? weekDayTile,
    Color? weekDayText,
    Color? weekDayBorder,
    Color? pageBackground,
    Color? hourLine,
    Color? halfHourLine,
    Color? quarterHourLine,
  }) {
    return WeekViewTheme(
      weekDayTile: weekDayTile ?? this.weekDayTile,
      weekDayText: weekDayText ?? this.weekDayText,
      weekDayBorder: weekDayBorder ?? this.weekDayBorder,
      pageBackground: pageBackground ?? this.pageBackground,
      hourLine: hourLine ?? this.hourLine,
      halfHourLine: halfHourLine ?? this.halfHourLine,
      quarterHourLine: quarterHourLine ?? this.quarterHourLine,
    );
  }

  @override
  ThemeExtension<WeekViewTheme> lerp(
    covariant ThemeExtension<WeekViewTheme>? other,
    double t,
  ) {
    // TODO(Shubham): Update this
    return this;
  }
}
