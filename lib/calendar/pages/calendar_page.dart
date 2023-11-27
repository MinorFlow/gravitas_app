import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with AutomaticKeepAliveClientMixin {
  DateTime today = DateTime.now();
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          child: TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(2001, 10, 27),
            lastDay: DateTime.utc(2030, 11, 27),
          ),
        ),
      ],
    );
  }
}
