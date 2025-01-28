import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../enumerations.dart';
import '../extension.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/week_view_widget.dart';
import 'create_event_page.dart';
import 'web/web_home_page.dart';

class WeekViewDemo extends StatefulWidget {
  const WeekViewDemo({super.key});

  @override
  _WeekViewDemoState createState() => _WeekViewDemoState();
}

class _WeekViewDemoState extends State<WeekViewDemo> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      webWidget: WebHomePage(
        selectedView: CalendarView.week,
      ),
      mobileWidget: Scaffold(
        primary: false,
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          backgroundColor: context.themeColor.primary,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: context.themeColor.onPrimary,
          ),
          elevation: 8,
          backgroundColor: context.themeColor.primary,
          onPressed: () => context.pushRoute(CreateEventPage()),
        ),
        body: WeekViewWidget(),
      ),
    );
  }
}
