import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  double repeatBarHeight = 300.0;

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
        backgroundColor: Theme.of(context).backgroundColor,
        shadowColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
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
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                BootstrapIcons.check2_circle,
                color: Color(0XFF8ABA41),
              ),
              splashRadius: 1.0,
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5,
          radius: const Radius.circular(20.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: startTimeBar
                            ? 410
                            : endTimeBar
                                ? 410
                                : 280,
                        margin:
                            const EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 8.0),
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: Icon(
                                    BootstrapIcons.fonts,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
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
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.5,
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          2.0, 0.0, 2.0, 0.0),
                                      hintText: 'Title',
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.5,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      border: UnderlineInputBorder(
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: Icon(
                                    BootstrapIcons.geo_alt,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
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
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.5,
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          2.0, 0.0, 2.0, 0.0),
                                      hintText: 'Location',
                                      hintStyle: TextStyle(
                                        color: Color(0XFFA1A1AA),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.5,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      border: UnderlineInputBorder(
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: Icon(
                                    BootstrapIcons.clock,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Theme.of(context).highlightColor,
                                        width: 0.2,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        2.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      date,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.5,
                                        color: Theme.of(context).highlightColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40.0,
                                  margin: const EdgeInsets.fromLTRB(
                                      16.0, 8.0, 16.0, 0.0),
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
                                        margin:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          'Start time',
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.5,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Material(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: 48,
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
                                                      color: Theme.of(context)
                                                          .highlightColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Icon(
                                                      startTimeBar
                                                          ? BootstrapIcons
                                                              .chevron_up
                                                          : BootstrapIcons
                                                              .chevron_down,
                                                      color: Theme.of(context)
                                                          .highlightColor,
                                                      size: 16.0,
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
                                            )),
                                      ),
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
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 4.0),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 120,
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
                                                    TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                ),
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
                                                height: 38,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: const Border
                                                            .fromBorderSide(
                                                        BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0XFF8ABA41))),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40.0,
                                  margin: const EdgeInsets.fromLTRB(
                                      16.0, 8.0, 16.0, 0.0),
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
                                        margin:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          'End time',
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.5,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Material(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: 48,
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
                                                      color: Theme.of(context)
                                                          .highlightColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Icon(
                                                      endTimeBar
                                                          ? BootstrapIcons
                                                              .chevron_up
                                                          : BootstrapIcons
                                                              .chevron_down,
                                                      color: Theme.of(context)
                                                          .highlightColor,
                                                      size: 16.0,
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
                                            )),
                                      ),
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
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 4.0),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 120,
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            CupertinoTheme(
                                              data: CupertinoThemeData(
                                                  textTheme:
                                                      CupertinoTextThemeData(
                                                dateTimePickerTextStyle:
                                                    TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                ),
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
                                                height: 38,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: const Border
                                                            .fromBorderSide(
                                                        BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0XFF8ABA41))),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
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
                            ? 110
                            : reminder == 1
                                ? 170
                                : reminder == 2
                                    ? 228
                                    : reminder == 3
                                        ? 286
                                        : reminder == 4
                                            ? 344
                                            : reminder == 5
                                                ? 402
                                                : reminder == 6
                                                    ? 412
                                                    : 170,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 8.0),
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: Icon(
                                    BootstrapIcons.arrow_left_right,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40.0,
                                  margin: const EdgeInsets.fromLTRB(
                                      16.0, 8.0, 16.0, 8.0),
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
                                      Text(
                                        'Repeat',
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color:
                                              Theme.of(context).highlightColor,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Material(
                                          elevation: 0,
                                          color: Colors.transparent,
                                          child: MaterialButton(
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            height: 48,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            child: Row(
                                              children: [
                                                Text(
                                                  repeatList[repeatValue],
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .highlightColor,
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Icon(
                                                    BootstrapIcons
                                                        .chevron_right,
                                                    color: Theme.of(context)
                                                        .highlightColor,
                                                    size: 14.0,
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
                                  ? 55
                                  : reminder == 2
                                      ? 110
                                      : reminder == 3
                                          ? 165
                                          : reminder == 4
                                              ? 220
                                              : reminder == 5
                                                  ? 275
                                                  : reminder == 6
                                                      ? 330
                                                      : 0,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: addReminderList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 4.0),
                                        child: index == 0
                                            ? Icon(
                                                BootstrapIcons.bell,
                                                color: Theme.of(context)
                                                    .highlightColor,
                                              )
                                            : null,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            16.0, 0.0, 16.0, 4.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        decoration: BoxDecoration(
                                          border: index == 5
                                              ? Border()
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
                                            Text(
                                              addReminderList[index],
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .highlightColor,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                BootstrapIcons.x,
                                                color: Theme.of(context)
                                                    .highlightColor,
                                                size: 22.0,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (addReminderList[index] ==
                                                      '10 minutes ago') {
                                                    deletedReminderList.insert(
                                                        0, '10 minutes ago');
                                                  } else if (addReminderList[
                                                          index] ==
                                                      '15 minutes ago') {
                                                    deletedReminderList.insert(
                                                        1, '15 minutes ago');
                                                  } else if (addReminderList[
                                                          index] ==
                                                      '20 minutes ago') {
                                                    deletedReminderList.insert(
                                                        2, '20 minutes ago');
                                                  } else if (addReminderList[
                                                          index] ==
                                                      '30 minutes ago') {
                                                    deletedReminderList.insert(
                                                        3, '30 minutes ago');
                                                  } else if (addReminderList[
                                                          index] ==
                                                      '1 hour ago') {
                                                    deletedReminderList.insert(
                                                        4, '1 hour ago');
                                                  } else if (addReminderList[
                                                          index] ==
                                                      '2 hours ago') {
                                                    deletedReminderList.insert(
                                                        5, '2 hours ago');
                                                  }
                                                  addReminderList.remove(
                                                      addReminderList[index]);
                                                  print(deletedReminderList);
                                                  reminder--;
                                                });
                                              },
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 4.0),
                                              child: Icon(
                                                BootstrapIcons.bell,
                                                color: Theme.of(context)
                                                    .highlightColor,
                                              ),
                                            )
                                          : Container(),
                                      Container(
                                        height: 40.0,
                                        alignment: Alignment.centerLeft,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'ADD REMINDER',
                                            style: TextStyle(
                                                color: Color(0XFF8ABA41)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              String reminderToInsert =
                                                  deletedReminderList[0];
                                              deletedReminderList.removeAt(0);
                                              print(deletedReminderList);
                                              if (reminder <
                                                  timeOptions.length) {
                                                switch (reminderToInsert) {
                                                  case '10 minutes ago':
                                                    addReminderList.insert(
                                                        0, reminderToInsert);
                                                    break;
                                                  case '15 minutes ago':
                                                    var indexLast =
                                                        addReminderList
                                                            .lastIndexOf(
                                                                '10 minutes ago');
                                                    addReminderList.insert(
                                                        indexLast + 1,
                                                        reminderToInsert);

                                                    break;
                                                  case '20 minutes ago':
                                                    var indexLast =
                                                        addReminderList
                                                            .lastIndexOf(
                                                                '15 minutes ago');
                                                    addReminderList.insert(
                                                        indexLast + 1,
                                                        reminderToInsert);

                                                    break;
                                                  case '30 minutes ago':
                                                    var indexLast =
                                                        addReminderList
                                                            .lastIndexOf(
                                                                '20 minutes ago');
                                                    addReminderList.insert(
                                                        indexLast + 1,
                                                        reminderToInsert);

                                                    break;
                                                  case '1 hour ago':
                                                    var indexLast =
                                                        addReminderList
                                                            .lastIndexOf(
                                                                '30 minutes ago');
                                                    addReminderList.insert(
                                                        indexLast + 1,
                                                        reminderToInsert);

                                                    break;
                                                  case '2 hours ago':
                                                    var indexLast =
                                                        addReminderList
                                                            .lastIndexOf(
                                                                '1 hour ago');
                                                    addReminderList.insert(
                                                        indexLast + 1,
                                                        reminderToInsert);

                                                    break;
                                                  default:
                                                    addReminderList
                                                        .add(reminderToInsert);
                                                    break;
                                                }

                                                print(deletedReminderList);
                                                reminder++;
                                              }

                                              /*
                                              if (reminderNumber == 0) {
                                                addedReminderList
                                                    .add('10 minutes ago');
                                                reminderNumber = 1;
                                              } else if (reminderNumber == 1) {
                                                addedReminderList
                                                    .add('20 minutes ago');
                                                reminderNumber = 2;
                                              } else if (reminderNumber == 2) {
                                                addedReminderList
                                                    .add('30 minutes ago');
                                                reminderNumber = 3;
                                              } else if (reminderNumber == 3) {
                                                addedReminderList
                                                    .add('1 hour ago');
                                                reminderNumber = 4;
                                              } else if (reminderNumber == 4) {
                                                addedReminderList
                                                    .add('2 hours ago');
                                                reminderNumber = 5;
                                              }

                                              if (reminder == 0) {
                                                addReminderList = [
                                                  '10 minutes ago',
                                                  '15 minutes ago',
                                                ];
                                                reminder = 1;
                                              } else if (reminder == 1) {
                                                addReminderList = [
                                                  '10 minutes ago',
                                                  '15 minutes ago',
                                                ];
                                                reminder = 2;
                                              } else if (reminder == 2) {
                                                addReminderList = [
                                                  '10 minutes ago',
                                                  '15 minutes ago',
                                                  '20 minutes ago',
                                                ];
                                                reminder = 3;
                                              } else if (reminder == 3) {
                                                addReminderList = [
                                                  '10 minutes ago',
                                                  '15 minutes ago',
                                                  '20 minutes ago',
                                                  '30 minutes ago',
                                                ];
                                                reminder = 4;
                                              } else if (reminder == 4) {
                                                addReminderList = [
                                                  '10 minutes ago',
                                                  '15 minutes ago',
                                                  '20 minutes ago',
                                                  '30 minutes ago',
                                                  '1 hour ago',
                                                ];
                                                reminder = 5;
                                              } else {
                                                addReminderList = [
                                                  '10 minutes ago',
                                                  '15 minutes ago',
                                                  '20 minutes ago',
                                                  '30 minutes ago',
                                                  '1 hour ago',
                                                  '2 hours ago',
                                                ];
                                                reminder = 6;
                                              }*/
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 58,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 4.0),
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
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 4.0,
                                  ),
                                  child: Icon(BootstrapIcons.fuel_pump,
                                      color: Theme.of(context).highlightColor,
                                      size: 22.0),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 4.0),
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
                                        padding:
                                            const EdgeInsets.only(left: 2.0),
                                        child: Text(
                                          'Device',
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Material(
                                          elevation: 0,
                                          color: Colors.transparent,
                                          child: MaterialButton(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    BootstrapIcons.circle_fill,
                                                    color:
                                                        devicesList[radioValue]
                                                            [2],
                                                    size: 11.0,
                                                  ),
                                                ),
                                                Text(
                                                  devicesList[radioValue][1],
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .highlightColor,
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
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 22.0),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0XFF8ABA41),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: 48,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    splashColor: const Color(0XFF8ABA41),
                    highlightColor: const Color.fromARGB(
                        255, 116, 155, 58), //Color(0XFF749B3A)
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
                        : const Text(
                            'Save',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0XFFFFFDFA),
                              letterSpacing: 1.5,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _chooseRepeatModal() {
    showModalBottomSheet<void>(
      constraints: BoxConstraints(maxHeight: 420),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: repeatBarHeight,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16.0),
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
                    height: 236,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: repeatList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 0.0,
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
                              minWidth: MediaQuery.of(context).size.width * 0.7,
                              height: 40,
                              splashColor: const Color(0XFFEAEAEC),
                              highlightColor: const Color(0XFFEAEAEC),
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
                                              ? repeatBarHeight = 420.0
                                              : repeatBarHeight = 300.0;

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
                                      ? repeatBarHeight = 420.0
                                      : repeatBarHeight = 300.0;

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
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.75,
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
                                                      .titleMedium),
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
          top: Radius.circular(24.0),
          bottom: Radius.zero,
        ),
      ),
    );
  }

  _chooseDeviceModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 250.0,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16.0),
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
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 0.0,
                    ),
                    child: Material(
                      elevation: 0,
                      color: Theme.of(context).backgroundColor,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.7,
                        height: 40,
                        splashColor: const Color(0XFFEAEAEC),
                        highlightColor: const Color(0XFFEAEAEC),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  BootstrapIcons.fuel_pump,
                                  color: devicesList[index][2],
                                  size: 18.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8.0),
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
                                      return const Color(0XFF8ABA41);
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
          top: Radius.circular(24.0),
          bottom: Radius.zero,
        ),
      ),
    );
  }
}
