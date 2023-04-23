// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

/// Paints 24 hour lines.
class HourLinePainter extends CustomPainter {
  /// Color of hour line
  final Color lineColor;

  /// Height of hour line
  final double lineHeight;

  /// Offset of hour line from left.
  final double offset;

  /// Height occupied by one minute of time stamp.
  final double minuteHeight;

  /// Flag to display vertical line at left or not.
  final bool showVerticalLine;

  /// left offset of vertical line.
  final double verticalLineOffset;

  /// Paints 24 hour lines.
  HourLinePainter({
    required this.lineColor,
    required this.lineHeight,
    required this.minuteHeight,
    required this.offset,
    required this.showVerticalLine,
    this.verticalLineOffset = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight;

    for (var i = 1; i < Constants.hoursADay; i++) {
      final dy = i * minuteHeight * 60;
      canvas.drawLine(Offset(offset, dy), Offset(size.width, dy), paint);
    }

    if (showVerticalLine)
      canvas.drawLine(Offset(offset + verticalLineOffset, 0),
          Offset(offset + verticalLineOffset, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is HourLinePainter &&
        (oldDelegate.lineColor != lineColor ||
            oldDelegate.offset != offset ||
            lineHeight != oldDelegate.lineHeight ||
            minuteHeight != oldDelegate.minuteHeight ||
            showVerticalLine != oldDelegate.showVerticalLine);
  }
}

/// Paints a single horizontal line at [offset].
class CurrentTimeLinePainter extends CustomPainter {
  /// Color of time indicator.
  final Color color;

  /// Height of time indicator.
  final double height;

  /// offset of time indicator.
  final Offset offset;

  /// Flag to show bullet at left side or not.
  final bool showBullet;

  /// Radius of bullet.
  final double bulletRadius;

  /// Time string
  final String timeString;

  /// Flag to show time at left side or not.
  final bool showTime;

  /// Flag to show time backgroud view.
  final bool showTimeBackgroundView;

  /// Width of time backgroud view.
  final double timeBackgroundViewWidth;

  /// Paints a single horizontal line at [offset].
  CurrentTimeLinePainter({
    required this.showBullet,
    required this.color,
    required this.height,
    required this.offset,
    required this.bulletRadius,
    required this.timeString,
    required this.showTime,
    required this.showTimeBackgroundView,
    required this.timeBackgroundViewWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(offset.dx - (showBullet ? 0 : 8), offset.dy),
      Offset(size.width, offset.dy),
      Paint()
        ..color = color
        ..strokeWidth = height,
    );

    if (showBullet)
      canvas.drawCircle(
          Offset(offset.dx, offset.dy), bulletRadius, Paint()..color = color);

    if (showTimeBackgroundView)
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            max(3, offset.dx - 68),
            offset.dy - 11,
            timeBackgroundViewWidth,
            24,
          ),
          Radius.circular(12),
        ),
        Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..strokeWidth = bulletRadius,
      );

    if (showTime)
      TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: timeString,
          style: TextStyle(
            fontSize: 12.0,
            color: showTimeBackgroundView ? Colors.white : color,
          ),
        ),
      )
        ..layout()
        ..paint(canvas, Offset(max(8, offset.dx - 63), offset.dy - 6));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is CurrentTimeLinePainter &&
      (color != oldDelegate.color ||
          height != oldDelegate.height ||
          offset != oldDelegate.offset ||
          bulletRadius != oldDelegate.bulletRadius ||
          timeString != oldDelegate.timeString ||
          timeBackgroundViewWidth != oldDelegate.timeBackgroundViewWidth ||
          showBullet != oldDelegate.showBullet ||
          showTime != oldDelegate.showTime ||
          showTimeBackgroundView != oldDelegate.showTimeBackgroundView);
}
