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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: Lottie.asset(
                    Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ?
                    'assets/images/testejson1.json' : 'assets/images/testejson.json',
                    width: 360,
                    height: 360,
                  ),
                ),
                Text(
                  '200 km',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                
              ],
            ),
            /*
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0),
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(150.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColorDark,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                          offset: const Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(150.0),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).backgroundColor,
                          radius: 120.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.5),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor,
                            blurRadius: 20.0,
                            spreadRadius: 1.0,
                            offset: const Offset(1.0, 1.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(200.0),
                      ),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0XFF8ABA41),
                              radius: 92.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 180,
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(170.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '200',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32.0,
                                        color:
                                            Theme.of(context).backgroundColor ==
                                                    const Color(0XFF282A37)
                                                ? Colors.white
                                                : const Color(0XFF8ABA41),
                                      ),
                                    ),
                                    Text(
                                      'km',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                        color:
                                            Theme.of(context).backgroundColor ==
                                                    const Color(0XFF282A37)
                                                ? Colors.white
                                                : const Color(0XFF8ABA41),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 25.0),
              child: TextButton(
                child: const Text(
                  'Total Charge',
                  style: TextStyle(
                    color: Color(0XFF8ABA41),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.36,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                        top: Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
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
                            margin:
                                const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
                            padding: EdgeInsets.fromLTRB(
                                4.0,
                                MediaQuery.of(context).size.height.toDouble() *
                                    batteryHeightList[9],
                                4.0,
                                4.0),
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).highlightColor,
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
                              child: Text('60%',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            )),
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            bottom: MediaQuery.of(context).size.height * 0.02),
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
                                  15.0, 10.0, 0.0, 0.0),
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
                                      fontWeight: FontWeight.w500,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Get.to(const Charging());
                            });
                          },
                          child: const Text(
                            'Start charging',
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
    );
  }
}
