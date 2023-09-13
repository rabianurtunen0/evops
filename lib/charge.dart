import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/chargeStatistics.dart';
import 'package:evops/charging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Charge extends StatefulWidget {
  const Charge({Key? key}) : super(key: key);

  @override
  State<Charge> createState() => _ChargeState();
}

class _ChargeState extends State<Charge> {
  NumberFormat myFormat = NumberFormat.decimalPattern('vi_VN');

  bool savingMode = true;
  int tyreItem = 0;
  int totalDistanceNumber = 200000;

  List batteryHeightList = [
    0.004, // 100%
    0.012, // 95-99%
    0.020, // 90-94%
    0.028, // 85-89%
    0.036, // 80-84%
    0.044, // 75-79%
    0.052, // 70-74%
    0.060, // 65-69%
    0.068, // 60-64%
    0.076, // 55-59%
    0.084, // 50-54%
    0.092, // 45-49%
    0.100, // 40-44%
    0.108, // 35-39%
    0.116, // 30-34%
    0.124, // 25-29%
    0.132, // 20-24%
    0.140, // 15-19%
    0.148, // 10-14%
    0.156, // 5-9%
    0.164, // 0-4%
  ];

  List devicesList = [
    ['assets/images/device.svg', 'Device1', const Color(0XFFBEF264)],
    ['assets/images/device.svg', 'Device2', const Color(0XFF84CC16)],
    ['assets/images/device.svg', 'Device3', const Color(0XFF4D7C0F)],
    ['assets/images/device.svg', 'Device4', const Color(0XFF365314)],
  ];

  int radioValue = 0;

  void getRadioValue() {
    setState(() {
      radioValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.asset(
                        Theme.of(context).backgroundColor ==
                                const Color(0XFFFFFFFF)
                            ? 'assets/images/charging1.json'
                            : 'assets/images/charging.json',
                      ),
                      Text(
                        '200 km',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Text(
                    'Total distance available to go',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(12.0),
                          top: Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.028,
                                MediaQuery.of(context).size.height * 0.014,
                                0.0,
                                MediaQuery.of(context).size.height * 0.021),
                            child: Text(
                              'Batttery energy',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.042,
                                0.0,
                                0.0,
                                0.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.01,
                                    MediaQuery.of(context)
                                            .size
                                            .height
                                            .toDouble() *
                                        batteryHeightList[9],
                                    MediaQuery.of(context).size.width * 0.01,
                                    MediaQuery.of(context).size.height * 0.004,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  height: MediaQuery.of(context).size.height *
                                      0.174,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0XFF8ABA41),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(0.0, 0.0),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0XFF8ABA41),
                                      borderRadius: BorderRadius.circular(9.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 1.0,
                                          spreadRadius: 0.2,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  '60%',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.028,
                                0.0,
                                0.0,
                                0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Saving mode',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Switch(
                                  value: savingMode,
                                  onChanged: (bool value) {
                                    setState(() {
                                      savingMode = value;
                                    });
                                  },
                                  activeColor: const Color(0XFF8ABA41),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(12.0),
                              top: Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.014, 0.0, 0.0),
                                child: Text(
                                  'Total distance',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width * 0.042, MediaQuery.of(context).size.height * 0.021, 0.0, MediaQuery.of(context).size.height * 0.021),
                                    child: SvgPicture.asset(
                                      'assets/images/distance.svg',
                                      width: MediaQuery.of(context).size.width * 0.072,
                                      height: MediaQuery.of(context).size.width * 0.072,
                                      color: Theme.of(context).highlightColor,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${myFormat.format(totalDistanceNumber)} km',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.02),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12.0),
                            top: Radius.circular(12.0),
                          ),
                        ),
                        child: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.circular(12.0),
                          color: Theme.of(context).cardColor,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width * 0.9,
                            height: 48,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                Get.to(const ChargeStatistics());
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Statistics',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Icon(
                                  BootstrapIcons.arrow_right,
                                  size: 20,
                                  color: Theme.of(context).highlightColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.05),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12.0),
                                top: Radius.circular(12.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      15.0, 15.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Time',
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).highlightColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '1h 27m',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Material(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: MaterialButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          devicesList[radioValue][1],
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .highlightColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Icon(
                                          BootstrapIcons.arrow_right,
                                          size: 20.0,
                                          color:
                                              Theme.of(context).highlightColor,
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _chooseDeviceModal();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.048,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12.0),
                                top: Radius.circular(12.0),
                              ),
                            ),
                            child: Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0XFF8ABA41),
                              child: MaterialButton(
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.9,
                                height: 48,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                splashColor: const Color(0XFF8ABA41),
                                highlightColor: const Color.fromARGB(
                                    255, 116, 155, 58), //Color(0XFF749B3A)
                                onPressed: () {
                                  setState(() {
                                    Get.to(const Charging(
                                      initialData: '1234 **** **** 5678',
                                    ));
                                  });
                                },
                                child: Text('Start Charging',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: ScreenUtil().setSp(13),
                                      color: const Color(0XFFFFFDFA),
                                      ),
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
