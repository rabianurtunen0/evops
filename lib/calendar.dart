import 'package:evops/newEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final box = GetStorage();

  DateTime today = DateTime.now();
  int differenceDate = 0;
  int selectYear = DateTime.now().year;
  int selectMonth = DateTime.now().month;
  int selectDay = DateTime.now().day;
  String selectDate = DateTime.now().toString();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      differenceDate = DateTime.utc(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .difference(DateTime.utc(day.year, day.month, day.day))
          .inDays;
      print(day);
      selectDate = day.toString();
      selectYear = day.year;
      selectMonth = day.month;
      selectDay = day.day;
    });
  }

  static const List<dynamic> eventsList = [
    //['19.05.2023', '10:00 - 11:00', 'Charged'],
    //['19.05.2023', '14:00 - 14:30', 'Not charged'],
    //['19.05.2023', '19:00 - 19:40', 'Not charged yet']
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(18.0, 102.0, 18.0, 0.0),
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 436,
              child: TableCalendar(
                focusedDay: today,
                firstDay: DateTime(2023),
                lastDay: DateTime(2123),
                startingDayOfWeek: StartingDayOfWeek.monday,
                sixWeekMonthsEnforced: true,
                daysOfWeekHeight: 24,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  weekendStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                  headerMargin: EdgeInsets.only(bottom: 16.0),
                  leftChevronIcon: Icon(
                    Icons.chevron_left_rounded,
                    color: Color(0XFF8ABA41),
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0XFF8ABA41),
                  ),
                ),
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (day) => isSameDay(day, today),
                calendarStyle: CalendarStyle(
                  outsideTextStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  defaultTextStyle: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontWeight: FontWeight.w600,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontWeight: FontWeight.w600,
                  ),
                  todayTextStyle: const TextStyle(
                    color: Color(0XFF8ABA41),
                    fontWeight: FontWeight.w800,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: const Color(0XFF8ABA41),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0XFF8ABA41),
                      width: 1,
                    ),
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 42.0),
            height: MediaQuery.of(context).size.height - 580,
            decoration: const BoxDecoration(
              color: Color(0XFF8ABA41),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.zero,
                top: Radius.circular(24.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SvgPicture.asset(
                    'assets/images/line.svg',
                    color: const Color(0XFFFFFDFA),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          differenceDate > 0
                              ? '$differenceDate days ago'
                              : differenceDate < 0
                                  ? '${differenceDate.abs()} days before'
                                  : 'Today',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      child: IconButton(
                        icon: const Icon(
                          BootstrapIcons.plus_circle_fill,
                          size: 16.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          box.write('year', selectYear);
                          box.write('month', selectMonth);
                          box.write('day', selectDay);
                          box.write('date', selectDate);
                          print(box.read('year'));
                          print(box.read('month'));
                          print(box.read('day'));
                          Get.to(const NewEvent());
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: eventsList.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: const Icon(
                            BootstrapIcons.calendar_plus,
                            color: Color(0XFFFAFAFA),
                            size: 60.0,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: eventsList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white70,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      eventsList[index][1],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
