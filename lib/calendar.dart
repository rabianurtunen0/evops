import 'package:evops/newEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 6,
              child: Container(
                  //height: MediaQuery.of(context).size.height * 0.44,
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.035),
                  alignment: Alignment.topCenter,
                  child: TableCalendar(
                    focusedDay: today,
                    firstDay: DateTime(2023),
                    lastDay: DateTime(2123),
                    rowHeight: MediaQuery.of(context).size.height * 0.052,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    sixWeekMonthsEnforced: true,
                    daysOfWeekHeight: MediaQuery.of(context).size.height * 0.03,
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
                        fontSize: ScreenUtil().setSp(14),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                      headerMargin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.012),
                      leftChevronIcon: Icon(
                        Icons.chevron_left_rounded,
                        color: Theme.of(context).primaryColor,
                        size: ScreenUtil().setSp(24),
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right_rounded,
                        color: Theme.of(context).primaryColor,
                        size: ScreenUtil().setSp(24),
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
            Flexible(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.049),
                //height: MediaQuery.of(context).size.height * 0.32,
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
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.012),
                      child: SvgPicture.asset(
                        'assets/images/line.svg',
                        height: MediaQuery.of(context).size.height * 0.0048,
                        color: const Color(0XFFFFFDFA),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.048,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.012),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            differenceDate > 0
                                ? '$differenceDate days ago'
                                : differenceDate < 0
                                    ? '${differenceDate.abs()} days before'
                                    : 'Today',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(14),
                              color: const Color(0XFFFFFDFA),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.008),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              BootstrapIcons.plus_circle_fill,
                              size: ScreenUtil().setSp(16),
                              color: const Color(0XFFFFFDFA),
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
                      child: eventsList.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.066),
                              child: Icon(
                                BootstrapIcons.calendar_plus,
                                color: const Color(0XFFFAFAFA),
                                size: ScreenUtil().setSp(60),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: eventsList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.012),
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
            ),
          ],
        ),
      ),
    );
  }
}
