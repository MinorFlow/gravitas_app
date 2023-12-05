import 'dart:html';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class Event{
  String title;

  Event(this.title);
}

class _CalendarPageState extends State<CalendarPage>
    with AutomaticKeepAliveClientMixin {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day+1,
  );

  DateTime today = DateTime.now();
  @override
  bool get wantKeepAlive => true;
  List<bool> _selections1 = List.generate(3, (index) => false); //버튼 눌렀는지 여부 저장
  
  Map<DateTime, dynamic> events = { //저장된 일정을 받는 배열
    DateTime.utc(2023,12,13) : [ Event('일정1'), Event('일정2') ],
    DateTime.utc(2023,12,25) : [ Event('일정3') ],
  };
  

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        Container( // 캘린더
          child: TableCalendar(
            eventLoader: _getEventsForDay,
            locale: 'ko-KR',
            focusedDay: today,
            firstDay: DateTime.utc(2021, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            daysOfWeekHeight: 30, // 날짜 설정 
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          // 선택된 날짜의 상태를 갱신합니다.	
          setState((){
            this.selectedDay = selectedDay;
          });
        },
        selectedDayPredicate: (DateTime day) {
          // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.	
          return isSameDay(selectedDay, day);
        },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: true,
              rightChevronVisible: true,
              titleTextStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ), //헤더 디자인
            calendarStyle: CalendarStyle(// 켈린더 내부 디자인
              outsideDaysVisible: false, //이전, 이후 달 보이지 않기
              defaultTextStyle: TextStyle(
                  //평일 날짜 디자인
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              weekendTextStyle: TextStyle(
                  //주말 날짜 디자인
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              todayDecoration: BoxDecoration(
                  // 오늘 날짜 디자인
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  ),
              todayTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,),              
              tableBorder: const TableBorder(
                top: BorderSide(color: Colors.black),
                horizontalInside: BorderSide(color: Colors.black),
                verticalInside: BorderSide(color: Colors.black),
              ),
              rowDecoration: const BoxDecoration(
                color: Colors.white,
              ),
              selectedDecoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 2,
                )
              ),
              selectedTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlue,
              )
            ),
          ),
        ), // 캘린더
        Container( //버튼
          child: ToggleButtons(
            renderBorder: true,
            borderRadius: BorderRadius.circular(10),
            borderWidth: 10,
            borderColor: Colors.white,
            selectedColor: Colors.white,
            fillColor: Colors.black,
            color: Colors.black12,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Today",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "ALL",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.tune),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                if(index == 0){
                  _selections1[0] = true;
                  _selections1[1] = false;
                  _selections1[2] = false;
                }
                else if(index == 1){
                  _selections1[0] = false;
                  _selections1[1] = true;
                  _selections1[2] = false;
                }
                else if(index == 2){
                  _selections1[0] = false;
                  _selections1[1] = false;
                  _selections1[2] = true;
                }
              });
            },
            isSelected: _selections1,
          ),
        ), // 토글 버튼
      ],
    );
  }
}
