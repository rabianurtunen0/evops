import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Sky { sun, moon }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scrollController = ScrollController();
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5.0,
          radius: const Radius.circular(20.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 36.0, 0.0, 24.0),
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0XFF8ABA41),
                        radius: 48.0,
                        child: Icon(BootstrapIcons.person_fill,
                            color: Colors.white, size: 36.0),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(64.0, 60.0, 0.0, 0.0),
                        child: Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.0)),
                            child: MaterialButton(
                              elevation: 0,
                              shape: const CircleBorder(),
                              color: const Color.fromARGB(255, 59, 97, 2),
                              padding: const EdgeInsets.all(9.0),
                              onPressed: () {},
                              splashColor: const Color(0XFF1A2E05),
                              highlightColor: const Color(0XFF1A2E05),
                              child: const Icon(
                                BootstrapIcons.pencil,
                                size: 12.0,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: const Text(
                    'Rabia Nur Tünen',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: Color(0XFF2A2B2E),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 365,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 244, 238),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.person,
                                color: Color(0XFF8ABA41),
                                size: 25.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Rabia Nur Tünen',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                    alignment: Alignment.centerRight,
                                    child: MaterialButton(
                                      minWidth: 16.0,
                                      onPressed:() {
                                        
                                      },
                                      child: const Icon(
                                      BootstrapIcons.pen,
                                      size: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.envelope_at, 
                                color: Color(0XFF8ABA41),
                                size: 22.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                        'rrabianurtunen@gmail.com',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.telephone,
                                color: Color(0XFF8ABA41),
                                size: 22.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                        '+90 507 823 10 63',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.geo_alt,
                                color: Color(0XFF8ABA41),
                                size: 22.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                        'Konya, Turkey',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.lock,
                                color: Color(0XFF8ABA41),
                                size: 22.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                    alignment: Alignment.centerLeft,
                                    child: SvgPicture.asset(
                                      'assets/images/dots.svg',
                                    ),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.credit_card_2_front,
                                color: Color(0XFF8ABA41),
                                size: 25.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        '**** **** **** 3437',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        BootstrapIcons.pen,
                        size: 14.0,
                      ),         
                    ),
                  ),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 305,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 244, 238),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.people,
                                color: Color(0XFF8ABA41),
                                size: 25.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        '',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        

                        
                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              alignment: Alignment.bottomCenter,
                              child: const Icon(
                                BootstrapIcons.person,
                                color: Color(0XFF8ABA41),
                                size: 25.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 48,
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 5.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0XFF2A2B2E),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'App Theme',
                                        style: TextStyle(
                                          color: Color(0XFF2A2B2E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  Container(
                                    
                                    child: Container(
                  width: 80,
                  height: 32,
                  alignment: Alignment.center,
                  child: CupertinoSlidingSegmentedControl<Sky>(
                    backgroundColor: CupertinoColors.systemGrey,
                    thumbColor: light ? Color(0XFFFFC841) : Color(0XFF2A2B2E),
                    groupValue: light ? Sky.sun : Sky.moon,
                    onValueChanged: (Sky? value) {
                      if (value != null) {
                        setState(() {
                          light = !light;
                        });
                      }
                    },
                    children: <Sky, Widget>{
                      Sky.sun: Icon(
                          BootstrapIcons.sun_fill,
                          color: light ? Colors.white : Colors.black,
                          size: 16.0,
                        ),
                      
                      Sky.moon: Icon(
                          BootstrapIcons.moon_fill,
                          color: light ? Colors.black : Colors.white,
                          size: 16,
                        ),
                    
                    },
                  ),
                ),
              
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        */

                      ],
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 227, 230, 223),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 180,
                  alignment: Alignment.center,
                  child: CupertinoSlidingSegmentedControl<Sky>(
                    backgroundColor: CupertinoColors.systemGrey,
                    thumbColor: light ? Color(0XFFFFC841) : Color(0XFF2A2B2E),
                    groupValue: light ? Sky.sun : Sky.moon,
                    onValueChanged: (Sky? value) {
                      if (value != null) {
                        setState(() {
                          light = !light;
                        });
                      }
                    },
                    children: <Sky, Widget>{
                      Sky.sun: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          BootstrapIcons.sun_fill,
                          color: light ? Colors.white : Colors.black,
                          size: 20.0,
                        ),
                      ),
                      Sky.moon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          BootstrapIcons.moon_fill,
                          color: light ? Colors.black : Colors.white,
                          size: 20,
                        ),
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
