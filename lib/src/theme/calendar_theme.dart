import 'package:flutter/material.dart';

import '../../calendar_view.dart';

class CalendarTheme {
  CalendarTheme._();

  // Light theme
  static final light = ThemeData.light().copyWith(
    extensions: [
      MonthViewTheme.light(),
      DayViewTheme.light(),
      WeekViewTheme.light(),
    ],
  );

  // Dark theme
  static final dark = ThemeData.dark().copyWith(
    extensions: [
      MonthViewTheme.dark(),
      DayViewTheme.dark(),
      WeekViewTheme.dark(),
    ],
  );
}
