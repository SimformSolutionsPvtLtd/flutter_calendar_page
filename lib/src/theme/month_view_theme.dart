import 'package:flutter/material.dart';

import 'light_app_colors.dart';

class MonthViewTheme extends ThemeExtension<MonthViewTheme> {
  /// Default is light theme
  MonthViewTheme({
    this.cellInMonth = LightAppColors.surfaceContainerLowest,
    this.cellNotInMonth = LightAppColors.surfaceContainerLow,
    this.cellText = LightAppColors.onSurface,
    this.weekDayTile = LightAppColors.surfaceContainerHigh,
    this.weekDayText = LightAppColors.onSurface,
    this.weekDayBorder = LightAppColors.outlineVariant,
    this.cellBorder = LightAppColors.surfaceContainerHigh,
  });

  final Color cellInMonth;
  final Color cellNotInMonth;
  final Color cellText;
  final Color cellBorder;

  /// Weekday tile color
  final Color weekDayTile;
  final Color weekDayText;
  final Color weekDayBorder;

  @override
  ThemeExtension<MonthViewTheme> copyWith({
    Color? cellInMonth,
    Color? cellNotInMonth,
    Color? cellText,
    Color? cellBorder,
    Color? weekDayTile,
    Color? weekDayText,
    Color? weekDayBorder,
  }) {
    return MonthViewTheme(
      cellInMonth: cellInMonth ?? this.cellInMonth,
      cellNotInMonth: cellNotInMonth ?? this.cellNotInMonth,
      cellText: cellText ?? this.cellText,
      weekDayTile: weekDayTile ?? this.weekDayTile,
      weekDayText: weekDayText ?? this.weekDayText,
      weekDayBorder: weekDayBorder ?? this.weekDayBorder,
      cellBorder: cellBorder ?? this.cellBorder,
    );
  }

  @override
  ThemeExtension<MonthViewTheme> lerp(
    covariant ThemeExtension<MonthViewTheme>? other,
    double t,
  ) {
    // TODO(Shubham): Update this
    return this;
  }
}
