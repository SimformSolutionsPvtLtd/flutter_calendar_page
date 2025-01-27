import 'package:flutter/material.dart';

import 'light_app_colors.dart';

class DayViewTheme extends ThemeExtension<DayViewTheme> {
  /// Default is light theme
  DayViewTheme({
    this.pageBackground = LightAppColors.surfaceContainerLowest,
  });

  final Color pageBackground;

  @override
  ThemeExtension<DayViewTheme> copyWith({
    Color? pageBackground,
  }) {
    return DayViewTheme(
      pageBackground: pageBackground ?? this.pageBackground,
    );
  }

  @override
  ThemeExtension<DayViewTheme> lerp(
    covariant ThemeExtension<DayViewTheme>? other,
    double t,
  ) {
    // TODO(Shubham): Update this
    return this;
  }
}
