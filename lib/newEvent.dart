import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  String startTime = DateFormat.jm().format(DateTime.now()).toString();
  String endTime = DateFormat.jm()
      .format(DateTime.now().add(const Duration(hours: 1)))
      .toString();
  DateTime time1 = DateTime.now();
  DateTime time2 = DateTime.now().add(const Duration(hours: 1));
  bool isLoading = false;
  bool startTimeBar = false;
  bool endTimeBar = false;
  bool deviceBar = false;
  bool againBar = false;

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

  List againList = ['Never', 'Everyday', 'Weekly', 'Monthly', 'Private'];

  List addReminderList = [
    '10 minutes ago',
  ];

  List addedReminderList = [
    '10 minutes ago',
  ];

  List deletedReminderList = [

  ];
  int reminder = 0;
  bool reminderValue = true;
  int reminderNumber = 1;

  @override
  void initState() {
    selectDeviceValues;
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0XFF2A2B2E),
            ),
            splashColor: Colors.white,
            highlightColor: Colors.white,
          ),
        ),
        title: Container(
          alignment: Alignment.bottomLeft,
          child: const Text(
            'Create Charging Event',
            style: TextStyle(
              color: Color(0XFF2A2B2E),
              fontSize: 16.0,
            ),
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
                  icon: const Icon(BootstrapIcons.check2_circle,
                      color: Color(0XFF8ABA41)))),
        ],
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5,
          radius: const Radius.circular(20.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  height: startTimeBar
                      ? 410
                      : endTimeBar
                          ? 410
                          : 280,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 8.0),
                  decoration: const BoxDecoration(
                    color: Color(0XFFFAFAFA),
                    borderRadius: BorderRadius.vertical(
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
                            child: const Icon(
                              BootstrapIcons.fonts,
                              color: Color(0XFF71717A),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0XFFA1A1AA),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              cursorColor: const Color(0XFF8ABA41),
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.5,
                                color: Color(0XFF2A2B2E),
                              ),
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                hintText: 'Title',
                                hintStyle: TextStyle(
                                  color: Color(0XFFA1A1AA),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.5,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                            child: const Icon(
                              BootstrapIcons.geo_alt,
                              color: Color(0XFF71717A),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0XFFA1A1AA),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              cursorColor: const Color(0XFF8ABA41),
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.5,
                                color: Color(0XFF2A2B2E),
                              ),
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                                hintText: 'Location',
                                hintStyle: TextStyle(
                                  color: Color(0XFFA1A1AA),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.5,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                            child: const Icon(
                              BootstrapIcons.clock,
                              color: Color(0XFF71717A),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0XFFA1A1AA),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 2.0),
                                  child: Text(
                                    date,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.5,
                                      color: Color(0XFF2A2B2E),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Material(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      height: 48,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Text(
                                            '',
                                            style: TextStyle(
                                              color: Color(0XFF2A2B2E),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Icon(
                                              BootstrapIcons.chevron_right,
                                              color: Colors.black,
                                              size: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40.0,
                            margin:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0XFFA1A1AA),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 4.0),
                                  child: const Text(
                                    'Start time',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.5,
                                      color: Color(0XFF2A2B2E),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Material(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: 48,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Text(
                                              startTime,
                                              style: TextStyle(
                                                color: Color(0XFF2A2B2E),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Icon(
                                                startTimeBar
                                                    ? BootstrapIcons.chevron_up
                                                    : BootstrapIcons
                                                        .chevron_down,
                                                color: Colors.black,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 120,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      CupertinoTheme(
                                        data: const CupertinoThemeData(
                                            textTheme: CupertinoTextThemeData(
                                          dateTimePickerTextStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black,
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
                                          mode: CupertinoDatePickerMode.time,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 38,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border:
                                                  const Border.fromBorderSide(
                                                      BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0XFF8ABA41))),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
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
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40.0,
                            margin:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                            decoration: endTimeBar
                                ? const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0XFFA1A1AA),
                                        width: 1.0,
                                      ),
                                    ),
                                  )
                                : BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 4.0),
                                  child: const Text(
                                    'End time',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.5,
                                      color: Color(0XFF2A2B2E),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Material(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: 48,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Text(
                                              endTime,
                                              style: TextStyle(
                                                color: Color(0XFF2A2B2E),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Icon(
                                                endTimeBar
                                                    ? BootstrapIcons.chevron_up
                                                    : BootstrapIcons
                                                        .chevron_down,
                                                color: Colors.black,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 120,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      CupertinoTheme(
                                        data: const CupertinoThemeData(
                                            textTheme: CupertinoTextThemeData(
                                          dateTimePickerTextStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black,
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
                                          mode: CupertinoDatePickerMode.time,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 38,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border:
                                                  const Border.fromBorderSide(
                                                      BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0XFF8ABA41))),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
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
                  height: againBar
                      ? 388
                      : reminder == 0
                          ? 170
                          : reminder == 1
                              ? 228
                              : reminder == 2
                                  ? 286
                                  : reminder == 3
                                      ? 344
                                      : reminder == 4
                                          ? 402
                                          : reminder == 5
                                              ? 412
                                              : 170,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 8.0),
                  decoration: const BoxDecoration(
                    color: Color(0XFFFAFAFA),
                    borderRadius: BorderRadius.vertical(
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
                            child: const Icon(
                              BootstrapIcons.arrow_left_right,
                              color: Color(0XFF71717A),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40.0,
                            margin:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0XFFA1A1AA),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Again',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0XFF2A2B2E),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Material(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      height: 48,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Never',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Icon(
                                              againBar
                                                  ? BootstrapIcons.chevron_up
                                                  : BootstrapIcons.chevron_down,
                                              color: Colors.black,
                                              size: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          againBar = !againBar;
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
                      againBar
                          ? Container(
                              height: 200,
                              color: Colors.transparent,
                            )
                          : Container(),
                      Container(
                        height: reminder == 0
                            ? 55
                            : reminder == 1
                                ? 110
                                : reminder == 2
                                    ? 165
                                    : reminder == 3
                                        ? 220
                                        : reminder == 4
                                            ? 275
                                            : reminder == 5
                                                ? 330
                                                : 55,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0XFFFAFAFA),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: addReminderList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  child: index == 0
                                      ? const Icon(
                                          BootstrapIcons.bell,
                                          color: Color(0XFF71717A),
                                        )
                                      : null,
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 4.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0XFFA1A1AA),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        addReminderList[index],
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          BootstrapIcons.x,
                                          color: Color(0XFF2A2B2E),
                                          size: 22.0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (addReminderList[index] ==
                                                '10 minutes ago') {
                                              addReminderList.removeAt(index);
                                              deletedReminderList.add('10 minutes ago');
                                              reminder = reminder - 1;
                                            } else if (addReminderList[index] ==
                                                '15 minutes ago') {
                                              addReminderList.removeAt(index);
                                              deletedReminderList.add('15 minutes ago');
                                              reminder = reminder - 1;
                                            } else if (addReminderList[index] ==
                                                '20 minutes ago') {
                                              addReminderList.removeAt(index);
                                              deletedReminderList.add('20 minutes ago');
                                              reminder = reminder - 1;
                                            } else if (addReminderList[index] ==
                                                '30 minutes ago') {
                                              addReminderList.removeAt(index);
                                              deletedReminderList.add('30 minutes ago');
                                              reminder = reminder - 1;
                                            } else if (addReminderList[index] ==
                                                '1 hour ago') {
                                              addReminderList.removeAt(index);
                                              deletedReminderList.add('1 hour ago');
                                              reminder = reminder - 1;
                                            } else {
                                              addReminderList.removeAt(index);
                                              deletedReminderList.add('2 hours ago');
                                              reminder = reminder - 1;
                                            }
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(22.0, 8.0, 22.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 23.0, vertical: 4.0),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                      reminder == 5
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(),
                                Container(
                                  height: 40.0,
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0XFFFAFAFA),
                                      foregroundColor: const Color(0XFFFAFAFA),
                                    ),
                                    child: const Text(
                                      'ADD REMINDER',
                                      style:
                                          TextStyle(color: Color(0XFF8ABA41)),
                                    ),
                                    onPressed: () {
                                      setState(() {


                                        
                                        if(reminderNumber == 0) {
                                          addedReminderList.add('10 minutes ago');
                                          reminderNumber = 1;
                                        }
                                        else if(reminderNumber == 1) {
                                          addedReminderList.add('20 minutes ago');
                                          reminderNumber = 2;
                                        }
                                        else if(reminderNumber == 2) {
                                          addedReminderList.add('30 minutes ago');
                                          reminderNumber = 3;
                                        }
                                        else if(reminderNumber == 3) {
                                          addedReminderList.add('1 hour ago');
                                          reminderNumber = 4;
                                        }
                                        else if(reminderNumber == 4) {
                                          addedReminderList.add('2 hours ago');
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
                                            '20 minutes ago'
                                          ];
                                          reminder = 2;
                                        } else if (reminder == 2) {
                                          addReminderList = [
                                            '10 minutes ago',
                                            '15 minutes ago',
                                            '20 minutes ago',
                                            '30 minutes ago'
                                          ];
                                          reminder = 3;
                                        } else if (reminder == 3) {
                                          addReminderList = [
                                            '10 minutes ago',
                                            '15 minutes ago',
                                            '20 minutes ago',
                                            '30 minutes ago',
                                            '1 hour ago'
                                          ];
                                          reminder = 4;
                                        } else {
                                          addReminderList = [
                                            '10 minutes ago',
                                            '15 minutes ago',
                                            '20 minutes ago',
                                            '30 minutes ago',
                                            '1 hour ago',
                                            '2 hours ago'
                                          ];
                                          reminder = 5;
                                        }
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
                  height: deviceBar ? 272 : 58,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 4.0),
                  decoration: const BoxDecoration(
                      color: Color(0XFFFAFAFA),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
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
                            child: const Icon(BootstrapIcons.fuel_pump,
                                color: Color(0XFF71717A), size: 22.0),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4.0),
                            decoration: deviceBar
                                ? const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Color(0XFFFAFAFA),
                                        width: 1.0,
                                      ),
                                      bottom: BorderSide(
                                        color: Color(0XFFA1A1AA),
                                        width: 1.0,
                                      ),
                                    ),
                                  )
                                : const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Color(0XFFFAFAFA),
                                        width: 1.0,
                                      ),
                                      bottom: BorderSide(
                                        color: Color(0XFFFAFAFA),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: const Text(
                                    'Device',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0XFF2A2B2E),
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
                                              color: selectDeviceValues[0],
                                              size: 11.0,
                                            ),
                                          ),
                                          Text(
                                            selectDeviceValues[1],
                                            style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Icon(
                                              deviceBar
                                                  ? BootstrapIcons.chevron_up
                                                  : BootstrapIcons.chevron_down,
                                              color: Colors.black,
                                              size: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          deviceBar = !deviceBar;
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
                      deviceBar
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(
                                  22.0, 8.0, 22.0, 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 23.0, vertical: 4.0),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    width: MediaQuery.of(context).size.width *
                                        0.64,
                                    height: 190.0,
                                    color: const Color(0XFFFAFAFA),
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: devicesList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 40.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                            horizontal: 0.0,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.fromBorderSide(
                                                BorderSide(
                                                  width: 1,
                                                  color: selectDeviceValues[
                                                              1] ==
                                                          devicesList[index][1]
                                                      ? const Color(0XFF8ABA41)
                                                      : const Color(0XFFFAFAFA),
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Material(
                                            elevation: 0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: selectDeviceValues[1] ==
                                                    devicesList[index][1]
                                                ? const Color(0XFFEAEAEC)
                                                : const Color(0XFFFAFAFA),
                                            child: MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              height: 40,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              splashColor:
                                                  const Color(0XFFEAEAEC),
                                              highlightColor:
                                                  const Color(0XFFEAEAEC),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Icon(
                                                      BootstrapIcons
                                                          .circle_fill,
                                                      color: devicesList[index]
                                                          [2],
                                                      size: 11.0,
                                                    ),
                                                  ),
                                                  Icon(BootstrapIcons.fuel_pump,
                                                      color: devicesList[index]
                                                          [2],
                                                      size: 18.0),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      devicesList[index][1],
                                                      style: const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0XFF2A2B2E),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onHighlightChanged: (value) {},
                                              onPressed: () {
                                                setState(() {
                                                  print(index);
                                                  selectDeviceValues = [
                                                    devicesList[index][2],
                                                    devicesList[index][1],
                                                  ];
                                                });
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _chooseDevice() {
    Container(
        height: 250.0,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: devicesList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 46.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Material(
                elevation: 0,
                color: selectDeviceValues[index] == 'true'
                    ? const Color(0XFF71717A)
                    : Colors.white,
                child: MaterialButton(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          BootstrapIcons.circle_fill,
                          color: devicesList[index][2],
                          /*color: index == 0
                                    ? Colors.greenAccent
                                    : index == 1
                                        ? Colors.blueAccent
                                        : index == 2
                                            ? Colors.purpleAccent
                                            : Colors.redAccent,
                                */
                          size: 14.0,
                        ),
                      ),
                      SvgPicture.asset(
                        devicesList[index][0],
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Text(devicesList[index][1]),
                      ),
                    ],
                  ),
                  onHighlightChanged: (value) {},
                  onPressed: () {
                    setState(() {
                      print(index);
                      /*for(int i = 0; i <= devicesList.length - 1; i ++) {
                                  if(index == i) {
                                    selectDeviceValues.insert(devicesList.length, 'false');
                                    selectDeviceValues[i] == 'true';
                                    print(selectDeviceValues);
                                  }                                
                                }*/
                      index == 0
                          ? selectDeviceValues = [
                              'true',
                              'false',
                              'false',
                              'false'
                            ]
                          : null;
                      index == 1
                          ? selectDeviceValues = [
                              'false',
                              'true',
                              'false',
                              'false'
                            ]
                          : null;
                      index == 2
                          ? selectDeviceValues = [
                              'false',
                              'false',
                              'false',
                              'false'
                            ]
                          : null;
                      index == 3
                          ? selectDeviceValues = [
                              'false',
                              'false',
                              'false',
                              'true'
                            ]
                          : null;

                      Navigator.of(context).pop();
                      /*
                      for (int i = 0; i <= devicesList.length - 1; i++) {
                        deviceName = selectDeviceValues[i] == 'true'
                            ? devicesList[i][1]
                            : devicesList[0][1];
                        deviceColor = selectDeviceValues[i] == 'true'
                            ? colors[i]
                            : colors[0];
                      }
                      */
                    });
                  },
                ),
              ),
            );
          },
        ));
  }

  void _chooseDeviceModal() {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return Container(
                height: 250.0,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: devicesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 46.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Material(
                        elevation: 0,
                        color: selectDeviceValues[index] == 'true'
                            ? const Color(0XFF71717A)
                            : Colors.white,
                        child: MaterialButton(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  BootstrapIcons.circle_fill,
                                  color: devicesList[index][2],
                                  /*color: index == 0
                                    ? Colors.greenAccent
                                    : index == 1
                                        ? Colors.blueAccent
                                        : index == 2
                                            ? Colors.purpleAccent
                                            : Colors.redAccent,
                                */
                                  size: 14.0,
                                ),
                              ),
                              SvgPicture.asset(
                                devicesList[index][0],
                                width: 20,
                                height: 20,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: Text(devicesList[index][1]),
                              ),
                            ],
                          ),
                          onHighlightChanged: (value) {},
                          onPressed: () {
                            bottomState(() {
                              setState(() {
                                print(index);
                                /*for(int i = 0; i <= devicesList.length - 1; i ++) {
                                  if(index == i) {
                                    selectDeviceValues.insert(devicesList.length, 'false');
                                    selectDeviceValues[i] == 'true';
                                    print(selectDeviceValues);
                                  }                                
                                }*/
                                index == 0
                                    ? selectDeviceValues = [
                                        'true',
                                        'false',
                                        'false',
                                        'false'
                                      ]
                                    : null;
                                index == 1
                                    ? selectDeviceValues = [
                                        'false',
                                        'true',
                                        'false',
                                        'false'
                                      ]
                                    : null;
                                index == 2
                                    ? selectDeviceValues = [
                                        'false',
                                        'false',
                                        'false',
                                        'false'
                                      ]
                                    : null;
                                index == 3
                                    ? selectDeviceValues = [
                                        'false',
                                        'false',
                                        'false',
                                        'true'
                                      ]
                                    : null;

                                Navigator.of(context).pop();
                                /*
                                for (int i = 0;
                                    i <= devicesList.length - 1;
                                    i++) {
                                  deviceName = selectDeviceValues[i] == 'true'
                                      ? devicesList[i][1]
                                      : devicesList[0][1];
                                  deviceColor = selectDeviceValues[i] == 'true'
                                      ? colors[i]
                                      : colors[0];
                                }
                                */
                              });
                            });
                          },
                        ),
                      ),
                    );
                  },
                ));
          },
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
    future.then((void value) => _closeChooseDeviceModal(value));
  }

  void _closeChooseDeviceModal(void value) {
    print('modal closed');
  }

  void _chooseStartTime() {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return Container(
              height: 250.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.white,
              ),
              child: CupertinoDatePicker(
                  initialDateTime: time1,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() {
                      time1 = newTime;
                    });
                  }),
            );
          },
        );
      },
    );
  }
}
