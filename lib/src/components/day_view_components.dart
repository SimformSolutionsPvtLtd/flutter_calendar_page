// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../calendar_event_data.dart';
import '../constants.dart';
import '../extensions.dart';
import '../style/header_style.dart';
import '../typedefs.dart';
import 'common_components.dart';

/// This class defines default tile to display in day view.
class RoundedEventTile extends StatelessWidget {
  /// Title of the tile.
  final String title;

  /// Description of the tile.
  final String description;

  /// Background color of tile.
  /// Default color is [Colors.blue]
  final Color backgroundColor;

  /// If same tile can have multiple events.
  /// In most cases this value will be 1 less than total events.
  final int totalEvents;

  /// Padding of the tile. Default padding is [EdgeInsets.zero]
  final EdgeInsets padding;

  /// Margin of the tile. Default margin is [EdgeInsets.zero]
  final EdgeInsets margin;

  /// Border radius of tile.
  final BorderRadius borderRadius;

  /// Style for title
  final TextStyle? titleStyle;

  /// Style for description
  final TextStyle? descriptionStyle;

  /// This is default tile to display in day view.
  const RoundedEventTile({
    Key? key,
    required this.title,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.description = "",
    this.borderRadius = BorderRadius.zero,
    this.totalEvents = 1,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title.isNotEmpty)
            Expanded(
              child: Text(
                title,
                style: titleStyle ??
                    TextStyle(
                      fontSize: 20,
                      color: backgroundColor.accent,
                    ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          if (description.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  description,
                  style: descriptionStyle ??
                      TextStyle(
                        fontSize: 17,
                        color: backgroundColor.accent.withAlpha(200),
                      ),
                ),
              ),
            ),
          if (totalEvents > 1)
            Expanded(
              child: Text(
                "+${totalEvents - 1} more",
                style: (descriptionStyle ??
                        TextStyle(
                          color: backgroundColor.accent.withAlpha(200),
                        ))
                    .copyWith(fontSize: 17),
              ),
            ),
        ],
      ),
    );
  }
}

/// A header widget to display on day view.
class DayPageHeader extends CalendarPageHeader {
  /// A header widget to display on day view.
  const DayPageHeader({
    Key? key,
    VoidCallback? onNextDay,
    AsyncCallback? onTitleTapped,
    VoidCallback? onPreviousDay,
    Color iconColor = Constants.black,
    Color backgroundColor = Constants.headerBackground,
    StringProvider? dateStringBuilder,
    required DateTime date,
    HeaderStyle headerStyle = const HeaderStyle(),
  }) : super(
          key: key,
          date: date,
          // ignore_for_file: deprecated_member_use_from_same_package
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          onNextDay: onNextDay,
          onPreviousDay: onPreviousDay,
          onTitleTapped: onTitleTapped,
          dateStringBuilder:
              dateStringBuilder ?? DayPageHeader._dayStringBuilder,
          headerStyle: headerStyle,
        );
  static String _dayStringBuilder(DateTime date, {DateTime? secondaryDate}) =>
      "${date.day} - ${date.month} - ${date.year}";
}

class DefaultTimeLineMark extends StatelessWidget {
  /// Defines time to display
  final DateTime date;

  /// StringProvider for time string
  final StringProvider? timeStringBuilder;

  /// Text style for time string.
  final TextStyle? markingStyle;

  /// Time marker for timeline used in week and day view.
  const DefaultTimeLineMark({
    Key? key,
    required this.date,
    this.markingStyle,
    this.timeStringBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeString = (timeStringBuilder != null)
        ? timeStringBuilder!(date)
        : "${((date.hour - 1) % 12) + 1} ${date.hour ~/ 12 == 0 ? "am" : "pm"}";
    return Transform.translate(
      offset: Offset(0, -7.5),
      child: Padding(
        padding: const EdgeInsets.only(right: 7.0),
        child: Text(
          timeString,
          textAlign: TextAlign.right,
          style: markingStyle ??
              TextStyle(
                fontSize: 15.0,
              ),
        ),
      ),
    );
  }
}

/// This class is defined default view of full day event
class FullDayEventView<T> extends StatelessWidget {
  const FullDayEventView({
    Key? key,
    this.boxConstraints = const BoxConstraints(maxHeight: 100),
    required this.events,
    this.padding,
    this.itemView,
    this.titleStyle,
    this.onEventTap,
    required this.date,
  }) : super(key: key);

  /// Constraints for view
  final BoxConstraints boxConstraints;

  /// Define List of Event to display
  final List<CalendarEventData<T>> events;

  /// Define Padding of view
  final EdgeInsets? padding;

  /// Define custom Item view of Event.
  final Widget Function(CalendarEventData<T>? event)? itemView;

  /// Style for title
  final TextStyle? titleStyle;

  /// Called when user taps on event tile.
  final TileTapCallback<T>? onEventTap;

  /// Defines date for which events will be displayed.
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: boxConstraints,
      child: ListView.builder(
        itemCount: events.length,
        padding: padding,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onEventTap?.call(events[index], date),
          child: itemView?.call(events[index]) ??
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(1.0),
                height: 24,
                child: Text(
                  events[index].title,
                  style: titleStyle ??
                      TextStyle(
                        fontSize: 16,
                        color: events[index].color.accent,
                      ),
                  maxLines: 1,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: events[index].color,
                ),
                alignment: Alignment.centerLeft,
              ),
        ),
      ),
    );
  }
}

class SelectedRoundedEventTile extends StatelessWidget {
  /// Title of the tile.
  final String title;

  /// Description of the tile.
  final String description;

  /// Background color of tile.
  /// Default color is [Colors.blue]
  final Color backgroundColor;

  /// If same tile can have multiple events.
  /// In most cases this value will be 1 less than total events.
  final int totalEvents;

  /// Padding of the tile. Default padding is [EdgeInsets.zero]
  final EdgeInsets padding;

  /// Margin of the tile. Default margin is [EdgeInsets.zero]
  final EdgeInsets margin;

  /// Border radius of tile.
  final BorderRadius borderRadius;

  /// Style for title
  final TextStyle? titleStyle;

  /// Style for description
  final TextStyle? descriptionStyle;

  /// Color of the handle.
  final Color handleColor;

  /// The outline color of the tile when selected.
  final Color selectedOutlineColor;

  // Function when startButton is being draged.
  final Function(double value) changeStartTime;

  /// Function when endButton is being draged.
  final Function(double value) changeEndTime;

  /// Function to reschedule the event.
  final Function(double value) reschedule;

  ///
  final VoidCallback onEditComplete;

  const SelectedRoundedEventTile({
    Key? key,
    required this.title,
    required this.changeStartTime,
    required this.changeEndTime,
    required this.reschedule,
    required this.onEditComplete,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.description = "",
    this.borderRadius = BorderRadius.zero,
    this.totalEvents = 1,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
    this.descriptionStyle,
    this.handleColor = Colors.white,
    this.selectedOutlineColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta != null) {
          reschedule(details.primaryDelta!);
        }
      },
      onVerticalDragEnd: (details) {
        onEditComplete();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
              border: Border.all(
                color: selectedOutlineColor,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ??
                        TextStyle(
                          fontSize: 18,
                          color: backgroundColor.accent,
                        ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: backgroundColor.accent,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                if (totalEvents > 1)
                  Expanded(
                    child: Text(
                      "+${totalEvents - 1} more",
                      style: TextStyle(
                        color: backgroundColor.accent.withAlpha(200),
                      ).copyWith(fontSize: 17),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onVerticalDragEnd: (details) {
                      onEditComplete();
                    },
                    onVerticalDragUpdate: (details) {
                      if (details.primaryDelta != null) {
                        changeStartTime(details.primaryDelta!);
                      }
                    },
                    child: Icon(
                      Icons.circle_rounded,
                      color: handleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onVerticalDragEnd: (details) {
                      onEditComplete();
                    },
                    onVerticalDragUpdate: (details) {
                      if (details.primaryDelta != null) {
                        changeEndTime(details.primaryDelta!);
                      }
                    },
                    child: Icon(
                      Icons.circle_rounded,
                      color: handleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InteractiveRoundedEventTileOLD extends StatelessWidget {
  /// Title of the tile.
  final String title;

  /// Description of the tile.
  final String description;

  /// Background color of tile.
  /// Default color is [Colors.blue]
  final Color backgroundColor;

  /// If same tile can have multiple events.
  /// In most cases this value will be 1 less than total events.
  final int totalEvents;

  /// Padding of the tile. Default padding is [EdgeInsets.zero]
  final EdgeInsets padding;

  /// Margin of the tile. Default margin is [EdgeInsets.zero]
  final EdgeInsets margin;

  /// Border radius of tile.
  final BorderRadius borderRadius;

  /// Style for title
  final TextStyle? titleStyle;

  /// Style for description
  final TextStyle? descriptionStyle;

  final bool isSelected;

  /// Color of the handle.
  final Color handleColor;

  /// The outline color of the tile when selected.
  final Color selectedOutlineColor;

  /// Callback when tile is tapped.
  final VoidCallback onTap;

  // Function when startButton is being draged.
  final Function(double value) changeStartTime;

  /// Function when endButton is being draged.
  final Function(double value) changeEndTime;

  /// Function to reschedule the event.
  final Function(double value) reschedule;

  /// Callback when the user is done editing the event.
  final VoidCallback editComplete;

  const InteractiveRoundedEventTileOLD({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.changeStartTime,
    required this.changeEndTime,
    required this.reschedule,
    required this.editComplete,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.description = "",
    this.borderRadius = BorderRadius.zero,
    this.totalEvents = 1,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
    this.descriptionStyle,
    this.handleColor = Colors.white,
    this.selectedOutlineColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onVerticalDragUpdate: isSelected
          ? (details) {
              if (details.primaryDelta != null) {
                reschedule(details.primaryDelta!);
              }
            }
          : null,
      onVerticalDragEnd: isSelected
          ? (details) {
              editComplete();
            }
          : null,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: padding,
            margin: margin,
            decoration: isSelected
                ? BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                    border: Border.all(
                      color: selectedOutlineColor,
                      width: 2,
                    ),
                  )
                : BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ??
                        TextStyle(
                          fontSize: 18,
                          color: backgroundColor.accent,
                        ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: backgroundColor.accent,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                if (totalEvents > 1)
                  Expanded(
                    child: Text(
                      "+${totalEvents - 1} more",
                      style: TextStyle(
                        color: backgroundColor.accent.withAlpha(200),
                      ).copyWith(fontSize: 17),
                    ),
                  ),
              ],
            ),
          ),
          if (isSelected)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onVerticalDragEnd: (details) {
                        editComplete();
                      },
                      onVerticalDragUpdate: (details) {
                        if (details.primaryDelta != null) {
                          changeStartTime(details.primaryDelta!);
                        }
                      },
                      child: Icon(
                        Icons.circle_rounded,
                        color: handleColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            const SizedBox.shrink(),
          if (isSelected)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onVerticalDragEnd: (details) {
                        editComplete();
                      },
                      onVerticalDragUpdate: (details) {
                        if (details.primaryDelta != null) {
                          changeEndTime(details.primaryDelta!);
                        }
                      },
                      child: Icon(
                        Icons.circle_rounded,
                        color: handleColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
