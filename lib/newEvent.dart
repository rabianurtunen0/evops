import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final _scrollController = ScrollController();
  final box = GetStorage();
  final date = DateFormat('dd/MM/yyyy').format(DateTime(
      GetStorage().read('year'),
      GetStorage().read('month'),
      GetStorage().read('day')));
  DateTime time1 = DateTime.now();
  DateTime time2 = DateTime.now().add(const Duration(hours: 1));
  bool isLoading = false;
  bool dateBar = false;
  bool startTimeBar = false;
  bool endTimeBar = false;
  bool deviceBar = false;
  bool againBar = false;
  bool specialBar = false;

  List numberList = [];
  List list = ['day', 'week', 'month', 'year'];
  String specialDate1 = 'Every 1';
  String specialDate2 = 'day';
  int specialInitial1 = 0;
  int specialInitial2 = 0;

  int repeatValue = 0;
  bool repeatBarHeight = false;

  void getRepeatValue() {
    setState(() {
      repeatValue;
      repeatList;
    });
  }

  int radioValue = 0;

  void getRadioValue() {
    setState(() {
      radioValue;
    });
  }

  List devicesList = [
    ['assets/images/device.svg', 'Device1', const Color(0XFFBEF264)],
    ['assets/images/device.svg', 'Device2', const Color(0XFF84CC16)],
    ['assets/images/device.svg', 'Device3', const Color(0XFF4D7C0F)],
    ['assets/images/device.svg', 'Device4', const Color(0XFF365314)],
  ];

  List selectDeviceValues = [
    const Color(0XFFBEF264),
    'Device1',
  ];

  List repeatList = [
    'Never',
    'Every day',
    'Every week',
    'Every month',
    'Special',
  ];

  List addReminderList = [
    '10 minutes ago',
  ];

  List deletedReminderValues = [1, 2, 3, 4, 5];

  List deletedReminderList = [
    '15 minutes ago',
    '20 minutes ago',
    '30 minutes ago',
    '1 hour ago',
    '2 hours ago',
  ];

  var timeOptions = [
    '10 minutes ago',
    '15 minutes ago',
    '20 minutes ago',
    '30 minutes ago',
    '1 hour ago',
    '2 hours ago'
  ];

  int reminder = 1;
  bool reminderValue = true;

  @override
  void initState() {
    selectDeviceValues;
    for (int i = 1; i < 101; i++) {
      numberList.add(i);
    }
    print(numberList);
    super.initState();
  }

  @override
  void dispose() {
    selectDeviceValues;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: ScreenUtil().setSp(20),
              color: Theme.of(context).iconTheme.color,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
        title: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Create Charging Event',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5,
          radius: const Radius.circular(20.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                      children: [
                        Container(
                          height: startTimeBar
                              ? MediaQuery.of(context).size.height * 0.48
                              : endTimeBar
                                  ? MediaQuery.of(context).size.height * 0.48
                                  : MediaQuery.of(context).size.height * 0.32,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.06,
                              MediaQuery.of(context).size.height * 0.024,
                              MediaQuery.of(context).size.width * 0.06,
                              MediaQuery.of(context).size.height * 0.006),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(12.0),
                              top: Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.006,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                    child: Icon(
                                      BootstrapIcons.fonts,
                                      size: ScreenUtil().setSp(24),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).highlightColor,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      cursorColor: const Color(0XFF8ABA41),
                                      textInputAction: TextInputAction.next,
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            0.0,
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            0.0),
                                        hintText: 'Title',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.010,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                    child: Icon(
                                      BootstrapIcons.geo_alt,
                                      size: ScreenUtil().setSp(20),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).highlightColor,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      cursorColor: const Color(0XFF8ABA41),
                                      textInputAction: TextInputAction.next,
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            0.0,
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            0.0),
                                        hintText: 'Location',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.014,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                    child: Icon(
                                      BootstrapIcons.clock,
                                      size: ScreenUtil().setSp(18),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).highlightColor,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.006,
                                          MediaQuery.of(context).size.height *
                                              0.008,
                                          0.0,
                                          0.0),
                                      child: Text(
                                        date,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: ScreenUtil().setSp(12),
                                                      color: Theme.of(context).highlightColor,
                                                    ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: ScreenUtil().setSp(20),
                                    height: ScreenUtil().setSp(20),
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.006,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).highlightColor,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.006,
                                              MediaQuery.of(context).size.height *
                                                  0.008,
                                              0.0,
                                              0.0),
                                          child: Text(
                                            'Start time',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.centerRight,
                                            margin: EdgeInsets.fromLTRB(
                                                0.0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.008,
                                                0.0,
                                                0.0),
                                            child: Material(
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child: MaterialButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      DateFormat.jm()
                                                          .format(time1)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: ScreenUtil().setSp(11),
                                                        color: Theme.of(context).highlightColor,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.018),
                                                      child: Icon(
                                                        startTimeBar
                                                            ? BootstrapIcons
                                                                .chevron_up
                                                            : BootstrapIcons
                                                                .chevron_down,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                        size: ScreenUtil()
                                                            .setSp(14),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    startTimeBar = !startTimeBar;
                                                    endTimeBar = false;
                                                  });
                                                },
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              startTimeBar
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setSp(20),
                                          height: ScreenUtil().setSp(20),
                                          margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                            0.0,
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.154,
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                              color: Theme.of(context)
                                                  .highlightColor,
                                              width: 0.2,
                                            )),
                                          ),
                                          alignment: Alignment.center,
                                          child: Stack(
                                            children: [
                                              CupertinoTheme(
                                                data: CupertinoThemeData(
                                                    textTheme:
                                                        CupertinoTextThemeData(
                                                  dateTimePickerTextStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .titleSmall,
                                                )),
                                                child: CupertinoDatePicker(
                                                  initialDateTime: time1,
                                                  onDateTimeChanged:
                                                      (DateTime newTime) {
                                                    setState(() {
                                                      time1 = newTime;
                                                    });
                                                  },
                                                  use24hFormat: false,
                                                  minimumDate: DateTime.now(),
                                                  minuteInterval: 1,
                                                  mode: CupertinoDatePickerMode
                                                      .time,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.044,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.022),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      border: Border.fromBorderSide(
                                                          BorderSide(
                                                              width: 1,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: ScreenUtil().setSp(20),
                                    height: ScreenUtil().setSp(20),
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.006,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: endTimeBar
                                        ? BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Theme.of(context)
                                                    .highlightColor,
                                                width: 0.2,
                                              ),
                                            ),
                                          )
                                        : BoxDecoration(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.012,
                                              MediaQuery.of(context).size.height *
                                                  0.008,
                                              0.0,
                                              0.0),
                                          child: Text(
                                            'End time',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.centerRight,
                                            margin: EdgeInsets.fromLTRB(
                                                0.0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.008,
                                                0.0,
                                                0.0),
                                            child: Material(
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child: MaterialButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      DateFormat.jm()
                                                          .format(time2)
                                                          .toString(),
                                                      style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: ScreenUtil().setSp(11),
                                                      color: Theme.of(context).highlightColor,
                                                    ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.018),
                                                      child: Icon(
                                                        endTimeBar
                                                            ? BootstrapIcons
                                                                .chevron_up
                                                            : BootstrapIcons
                                                                .chevron_down,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                        size: ScreenUtil()
                                                            .setSp(14),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    endTimeBar = !endTimeBar;
                                                    startTimeBar = false;
                                                  });
                                                },
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              endTimeBar
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setSp(20),
                                          height: ScreenUtil().setSp(20),
                                          margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                            0.0,
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.154,
                                          alignment: Alignment.center,
                                          child: Stack(
                                            children: [
                                              CupertinoTheme(
                                                data: CupertinoThemeData(
                                                    textTheme:
                                                        CupertinoTextThemeData(
                                                  dateTimePickerTextStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .titleSmall,
                                                )),
                                                child: CupertinoDatePicker(
                                                  initialDateTime: time2,
                                                  onDateTimeChanged:
                                                      (DateTime newTime) {
                                                    setState(() {
                                                      time2 = newTime;
                                                    });
                                                  },
                                                  use24hFormat: false,
                                                  minimumDate: DateTime.now(),
                                                  minuteInterval: 1,
                                                  mode: CupertinoDatePickerMode
                                                      .time,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.044,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.022),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      border: Border.fromBorderSide(
                                                          BorderSide(
                                                              width: 1,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: reminder == 0
                              ? MediaQuery.of(context).size.height * 0.13
                              : reminder == 1
                                  ? MediaQuery.of(context).size.height * 0.18
                                  : reminder == 2
                                      ? MediaQuery.of(context).size.height * 0.24
                                      : reminder == 3
                                          ? MediaQuery.of(context).size.height *
                                              0.30
                                          : reminder == 4
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.36
                                              : reminder == 5
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.42
                                                  : reminder == 6
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.44
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.19,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.06,
                              MediaQuery.of(context).size.height * 0.006,
                              MediaQuery.of(context).size.width * 0.06,
                              MediaQuery.of(context).size.height * 0.006),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(12.0),
                              top: Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.006,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                    child: Icon(
                                      BootstrapIcons.arrow_left_right,
                                      size: ScreenUtil().setSp(18),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).highlightColor,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.006,
                                              MediaQuery.of(context).size.height *
                                                  0.008,
                                              0.0,
                                              0.0),
                                          child: Text(
                                            'Repeat',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0,
                                              MediaQuery.of(context).size.height *
                                                  0.008,
                                              0.0,
                                              0.0),
                                          child: Material(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: MaterialButton(
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    repeatList[repeatValue],
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: ScreenUtil().setSp(11),
                                                      color: Theme.of(context).highlightColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.018),
                                                    child: Icon(
                                                      BootstrapIcons
                                                          .chevron_right,
                                                      color: Theme.of(context)
                                                          .highlightColor,
                                                      size:
                                                          ScreenUtil().setSp(13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _chooseRepeatModal();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: reminder == 1
                                    ? MediaQuery.of(context).size.height * 0.06
                                    : reminder == 2
                                        ? MediaQuery.of(context).size.height *
                                            0.12
                                        : reminder == 3
                                            ? MediaQuery.of(context).size.height *
                                                0.18
                                            : reminder == 4
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.24
                                                : reminder == 5
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.30
                                                    : reminder == 6
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.36
                                                        : 0,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: addReminderList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.006,
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                            0.0,
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                          ),
                                          child: index == 0
                                              ? Icon(
                                                  BootstrapIcons.bell,
                                                  size: ScreenUtil().setSp(18),
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )
                                              : Container(
                                                  width: ScreenUtil().setSp(20),
                                                  height: ScreenUtil().setSp(20),
                                                ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.048,
                                          decoration: BoxDecoration(
                                            border: index == 5
                                                ? const Border()
                                                : Border(
                                                    bottom: BorderSide(
                                                      color: Theme.of(context)
                                                          .highlightColor,
                                                      width: 0.2,
                                                    ),
                                                  ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.006,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.008,
                                                    0.0,
                                                    0.0),
                                                child: Text(
                                                  addReminderList[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerRight,
                                                margin: EdgeInsets.fromLTRB(
                                                    0.0,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.008,
                                                    0.0,
                                                    0.0),
                                                child: IconButton(
                                                  splashRadius: 1.0,
                                                  icon: Icon(
                                                    BootstrapIcons.x,
                                                    color: Theme.of(context)
                                                        .highlightColor,
                                                    size: ScreenUtil().setSp(20),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      reminder--;
                                                      print('silinen seçenek -> ' + addReminderList[index]);
                                                      if(addReminderList[index] == '10 minutes ago') {
                                                        addReminderList.remove('10 minutes ago');
                                                        deletedReminderList.add('10 minutes ago');
                                                        print('add list' + addReminderList.toString());
                                                      } else if(addReminderList[index] == '15 minutes ago') {
                                                        addReminderList.remove('15 minutes ago');
                                                        deletedReminderList.add('15 minutes ago');
                                                        print('add list' + addReminderList.toString());
                                                      } else if(addReminderList[index] == '20 minutes ago') {
                                                        addReminderList.remove('20 minutes ago');
                                                        deletedReminderList.add('20 minutes ago');
                                                        print('add list' + addReminderList.toString());
                                                      } else if(addReminderList[index] == '30 minutes ago') {
                                                        addReminderList.remove('30 minutes ago');
                                                        deletedReminderList.add('30 minutes ago');
                                                        print('add list' + addReminderList.toString());
                                                      } else if(addReminderList[index] == '1 hour ago') {
                                                        addReminderList.remove('1 hour ago');
                                                        deletedReminderList.add('1 hour ago');
                                                        print('add list' + addReminderList.toString());
                                                      } else if(addReminderList[index] == '2 hours ago') {
                                                        addReminderList.remove('2 hours ago');
                                                        deletedReminderList.add('2 hours ago');
                                                        print('add list' + addReminderList.toString());
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              reminder == 6
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        addReminderList.length == 0
                                            ? Container(
                                                margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.027,
                                            MediaQuery.of(context).size.height *
                                                0.012,
                                            0.0,
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                          ),
                                                child: Icon(
                                                  BootstrapIcons.bell_slash,
                                                  size: ScreenUtil().setSp(18),
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                )
                                              )
                                            : Container(
                                                margin: EdgeInsets.fromLTRB(
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.021,
                                                  0.0,
                                                  0.0,
                                                ),
                                              ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width:
                                          addReminderList.isEmpty 
                                            ? MediaQuery.of(context).size.width * 0.72 
                                            : MediaQuery.of(context).size.width * 0.68,
                                          margin: addReminderList.isEmpty ? EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.004) : EdgeInsets.zero,
                                          child: Material(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: MaterialButton(
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: Text(
                                                'ADD REMINDER',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  reminder++;  
                                                    if(addReminderList.contains('10 minutes ago')) {
                                                      if(addReminderList.contains('15 minutes ago')) {
                                                        if(addReminderList.contains('20 minutes ago')) {
                                                          if(addReminderList.contains('30 minutes ago')) {
                                                            if(addReminderList.contains('1 hour ago')) {
                                                              if(addReminderList.contains('2 hours ago')) {
                                                              } else {
                                                              addReminderList.insert(5, '2 hours ago');
                                                              print('add list 7 ->> ' + addReminderList.toString());
                                                            }
                                                            } else {
                                                              addReminderList.insert(4, '1 hour ago');
                                                              print('add list 8 ->> ' + addReminderList.toString());
                                                            }
                                                          } else {
                                                            addReminderList.insert(3, '30 minutes ago');
                                                            print('add list 9 ->> ' + addReminderList.toString());
                                                          }
                                                        } else {
                                                          addReminderList.insert(2, '20 minutes ago');
                                                          print('add list 10 ->> ' + addReminderList.toString());
                                                        }
                                                      } else {
                                                        addReminderList.insert(1, '15 minutes ago');
                                                        print('add list 11 ->> ' + addReminderList.toString());
                                                      }
                                                    } else {
                                                      addReminderList.insert(0, '10 minutes ago');
                                                      print('add list 12 ->> ' + addReminderList.toString());
                                                    }
                                                    
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.066,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.06,
                              MediaQuery.of(context).size.height * 0.006,
                              MediaQuery.of(context).size.width * 0.06,
                              MediaQuery.of(context).size.height * 0.006),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.016,
                                      MediaQuery.of(context).size.height * 0.021,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.015,
                                    ),
                                    child: Icon(
                                      BootstrapIcons.fuel_pump,
                                      size: ScreenUtil().setSp(17),
                                      color: Theme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.66,
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    decoration: deviceBar
                                        ? const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Color(0XFFA1A1AA),
                                                width: 1.0,
                                              ),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.006,
                                              MediaQuery.of(context).size.height *
                                                  0.008,
                                              0.0,
                                              0.0),
                                          child: Text(
                                            'Device',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0,
                                              MediaQuery.of(context).size.height *
                                                  0.008,
                                              0.0,
                                              0.0),
                                          child: Material(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: MaterialButton(
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                      0.0,
                                                      0.0,
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.018, 
                                                      MediaQuery.of(context).size.height * 0.002),
                                                    child: Icon(
                                                      BootstrapIcons.circle_fill,
                                                      color:
                                                          devicesList[radioValue]
                                                              [2],
                                                      size:
                                                          ScreenUtil().setSp(11),
                                                    ),
                                                  ),
                                                  Text(
                                                    devicesList[radioValue][1],
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: ScreenUtil().setSp(11),
                                                      color: Theme.of(context).highlightColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _chooseDeviceModal();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.052,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.007,
                      MediaQuery.of(context).size.height * 0.016,
                      MediaQuery.of(context).size.width * 0.007,
                      0.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Theme.of(context).primaryColor,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.052,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      splashColor: Theme.of(context).primaryColor,
                      highlightColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            isLoading = false;
                            Get.back();
                          });
                        });
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Color(0XFFFFFDFA),
                              strokeWidth: 2.0,
                            )
                          : Text(
                              'Save',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _chooseRepeatModal() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: repeatBarHeight ? MediaQuery.of(context).size.height * 0.48 : MediaQuery.of(context).size.height * 0.34,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.012,
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24.0),
                  bottom: Radius.zero,
                ),
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: repeatList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          margin: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.004,
                          ),
                          decoration: repeatValue == 4
                              ? index == 4
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              Theme.of(context).highlightColor,
                                          width: 0.3,
                                        ),
                                      ),
                                    )
                                  : const BoxDecoration()
                              : const BoxDecoration(),
                          child: Material(
                            elevation: 0,
                            color: Theme.of(context).backgroundColor,
                            child: MaterialButton(
                              elevation: 0,
                              minWidth: MediaQuery.of(context).size.width,
                              splashColor: Theme.of(context).hoverColor,
                              highlightColor: Theme.of(context).hoverColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 8.0),
                                    child: Text(repeatList[index].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ),
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Radio(
                                      value: index,
                                      groupValue: repeatValue,
                                      onChanged: (value) {
                                        setState(() {
                                          repeatValue = value!;
                                          print(value);
                                          value == 4
                                              ? repeatBarHeight = true
                                              : repeatBarHeight = false;

                                          value == 4
                                              ? repeatList[4] =
                                                  '$specialDate1 $specialDate2'
                                              : null;
                                          getRepeatValue();
                                        });
                                      },
                                      fillColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return const Color(0XFF8ABA41);
                                          }
                                          return Theme.of(context)
                                              .highlightColor;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                setState(() {
                                  repeatValue = index;
                                  index == 4
                                      ? repeatBarHeight = true
                                      : repeatBarHeight = false;
                                  index == 4
                                      ? repeatList[4] =
                                          '$specialDate1 $specialDate2'
                                      : null;

                                  getRepeatValue();
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  repeatValue == 4
                      ? Align(
                          child: Container(
                            width:
                                            MediaQuery.of(context).size.width *
                                                0.66,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CupertinoTheme(
                                        data: CupertinoThemeData(
                                            textTheme: CupertinoTextThemeData(
                                          dateTimePickerTextStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        )),
                                        child: CupertinoPicker(
                                          scrollController:
                                              FixedExtentScrollController(
                                                  initialItem: specialInitial1),
                                          itemExtent: 30,
                                          onSelectedItemChanged: (int value) {
                                            setState(() {
                                              specialInitial1 = value;
                                              specialDate1 =
                                                  'Every ${(value + 1).toString()}';
                                              specialDate2 = specialDate1 ==
                                                      'Every 1'
                                                  ? list[specialInitial2]
                                                      .toString()
                                                  : '${list[specialInitial2]}s';
                                              repeatList[4] =
                                                  '$specialDate1 $specialDate2';
                                              print(repeatList[4]);
                                              getRepeatValue();
                                            });
                                          },
                                          children: List<Widget>.generate(
                                              numberList.length, (int index) {
                                            return Center(
                                              child: Text(
                                                  numberList[index].toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CupertinoTheme(
                                        data: CupertinoThemeData(
                                            textTheme: CupertinoTextThemeData(
                                          dateTimePickerTextStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        )),
                                        child: CupertinoPicker(
                                          scrollController:
                                              FixedExtentScrollController(
                                                  initialItem: specialInitial2),
                                          itemExtent: 30,
                                          onSelectedItemChanged: (int value) {
                                            setState(() {
                                              specialInitial2 = value;
                                              specialDate2 =
                                                  specialDate1 == 'Every 1'
                                                      ? list[value].toString()
                                                      : '${list[value]}s';
                                              repeatList[4] =
                                                  '$specialDate1 $specialDate2';
                                              print(repeatList[4]);
                                              getRepeatValue();
                                            });
                                          },
                                          children: List<Widget>.generate(
                                              list.length, (int index) {
                                            return Center(
                                              child: Text(
                                                  list[index].toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 38,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: const Border.fromBorderSide(
                                            BorderSide(
                                                width: 1,
                                                color: Color(0XFF8ABA41))),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          },
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36.0),
          bottom: Radius.zero,
        ),
      ),
    );
  }

  _chooseDeviceModal() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.28,
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.012,
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24.0),
                bottom: Radius.zero,
              ),
              color: Theme.of(context).backgroundColor,
            ),
            child: StatefulBuilder(builder: (context, setState) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: devicesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.004,
                    ),
                    child: Material(
                      elevation: 0,
                      color: Theme.of(context).backgroundColor,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        splashColor: Theme.of(context).hoverColor,
                        highlightColor: Theme.of(context).hoverColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  BootstrapIcons.fuel_pump,
                                  color: devicesList[index][2],
                                  size: ScreenUtil().setSp(16),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.036),
                                  child: Text(devicesList[index][1],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 0.9,
                              child: Radio(
                                value: index,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    radioValue = value!;
                                    print(value);
                                    getRadioValue();
                                  });
                                },
                                fillColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Theme.of(context).primaryColor;
                                    }
                                    return Theme.of(context).highlightColor;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            radioValue = index;
                            getRadioValue();
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            }));
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36.0),
          bottom: Radius.zero,
        ),
      ),
    );
  }
}
