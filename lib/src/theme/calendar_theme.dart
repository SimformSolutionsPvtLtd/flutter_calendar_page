import 'package:flutter/material.dart';

import '../../calendar_view.dart';
import 'calendar_theme_extension.dart';
import 'dark_app_colors.dart';
import 'day_view_theme.dart';
import 'month_view_theme.dart';
import 'week_view_theme.dart';

class CalendarTheme {
  CalendarTheme._();

  // Light theme
  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
      _monthViewTheme,
      _weekViewTheme,
      _dayViewTheme,
    ],
  );

  // Default colors assigned are of light theme
  static final _lightAppColors = CalendarThemeExtension();
  static final _monthViewTheme = MonthViewTheme();
  static final _weekViewTheme = WeekViewTheme();
  static final _dayViewTheme = DayViewTheme();

  // TODO(Shubham): Setup dark colors
  // Dark theme
  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
      _monthViewThemeDark,
      _weekViewThemeDark,
      _dayViewThemeDark,
    ],
  );

  static final _darkAppColors = CalendarThemeExtension(
    primary: DarkAppColors.primary,
    onPrimary: DarkAppColors.onPrimary,
    onPrimaryContainer: DarkAppColors.onPrimaryContainer,
    onSecondaryContainer: DarkAppColors.onSecondaryContainer,
    surfaceContainerHigh: DarkAppColors.surfaceContainerHigh,
    secondaryContainer: DarkAppColors.secondaryContainer,
    outlineVariant: DarkAppColors.outlineVariant,
    onSurface: DarkAppColors.onSurface,
  );

  static final _monthViewThemeDark = MonthViewTheme().copyWith(
    cellInMonth: DarkAppColors.surfaceContainerLowest,
    cellNotInMonth: DarkAppColors.surfaceContainerLow,
    cellText: DarkAppColors.onSurface,
    cellBorder: DarkAppColors.surfaceContainerHigh,
    weekDayTile: DarkAppColors.surfaceContainerHigh,
    weekDayText: DarkAppColors.onSurface,
    weekDayBorder: DarkAppColors.outlineVariant,
  );

  static final _weekViewThemeDark = WeekViewTheme().copyWith(
    weekDayTile: DarkAppColors.surfaceContainerHigh,
    weekDayText: DarkAppColors.onSurface,
    weekDayBorder: DarkAppColors.outlineVariant,
    pageBackground: DarkAppColors.surfaceContainerLowest,
    hourLine: DarkAppColors.surfaceContainerHighest,
    halfHourLine: DarkAppColors.surfaceContainerHighest,
    quarterHourLine: DarkAppColors.surfaceContainerHighest,
  );

  static final _dayViewThemeDark = DayViewTheme().copyWith(
    pageBackground: DarkAppColors.surfaceContainerLowest,
  );
}
