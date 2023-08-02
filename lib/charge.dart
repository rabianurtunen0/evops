import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/chargeStatistics.dart';
import 'package:evops/charging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    0.013, // 95-99%
    0.022, // 90-94%
    0.031, // 85-89%
    0.040, // 80-84%
    0.049, // 75-79%
    0.058, // 70-74%
    0.067, // 65-69%
    0.076, // 60-64%
    0.085, // 55-59%
    0.094, // 50-54%
    0.103, // 45-49%
    0.112, // 40-44%
    0.121, // 35-39%
    0.130, // 30-34%
    0.139, // 25-29%
    0.148, // 20-24%
    0.157, // 15-19%
    0.166, // 10-14%
    0.175, // 5-9%
    0.184, // 0-4%
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
              height: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        child: Lottie.asset(
                          Theme.of(context).backgroundColor ==
                                  const Color(0XFFFFFFFF)
                              ? 'assets/images/charging1.json'
                              : 'assets/images/charging.json',
                        ),
                      ),
                      Text(
                        '200 km',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const Text(
                    'Total distance available to go',
                    style: TextStyle(
                      color: Color(0XFF8ABA41),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.32,
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
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                            child: Text(
                              'Batttery energy',
                              style: TextStyle(
                                color: Theme.of(context).highlightColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 0.0),
                              padding: EdgeInsets.fromLTRB(
                                  4.0,
                                  MediaQuery.of(context)
                                          .size
                                          .height
                                          .toDouble() *
                                      batteryHeightList[9],
                                  4.0,
                                  4.0),
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.height * 0.2,
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
                                child: Text(
                                  '60%',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium,
                                ),
                              ),
                            ),
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Saving mode',
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
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
                          width: MediaQuery.of(context).size.width * 0.4,
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
                                margin: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  'Total distance',
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        15.0, 20.0, 0.0, 20.0),
                                    child: SvgPicture.asset(
                                      'assets/images/distance.svg',
                                      width: 32.0,
                                      height: 32.0,
                                      color: Theme.of(context).highlightColor,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${myFormat.format(totalDistanceNumber)} km',
                                      style: const TextStyle(
                                        color: Color(0XFF8ABA41),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
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
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Theme.of(context).highlightColor,
                                    letterSpacing: 1.5,
                                  ),
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
                                    color: Theme.of(context).highlightColor,
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
                                    color: Theme.of(context).highlightColor,
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
                                    Get.to(const Charging(initialData: '1234 **** **** 5678',));
                                  });
                                },
                                child: const Text(
                                  'Start Charging',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0XFFFFFDFA),
                                    letterSpacing: 1.5,
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
