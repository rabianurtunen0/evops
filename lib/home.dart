import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/assistantAI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evops/calendar.dart';
import 'package:evops/charge.dart';
import 'package:evops/devices.dart';
import 'package:evops/profile.dart';
import 'package:evops/map.dart';
import 'package:get/get.dart';
//import 'package:rive/rive.dart';
//import 'package:flutter_animated_icons/icons8.dart';
//import 'package:flutter_animated_icons/lottiefiles.dart';
//import 'package:lottie/lottie.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _pageController = PageController(initialPage: 0);
  int page = 0;
  bool light = true;
  //late AnimationController _settingController;
  //int activePage = 0;
  int maxCount = 5;

  final List<Widget> bottomBarPages = [
    const Devices(),
    const Charge(),
    const Calendar(),
    const Map(),
    const Profile(),
  ];

  static const List<dynamic> devicesList = [
    ['assets/images/device.jpeg', 'Device1', '1. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device2', '2. ürünün açıklaması'],
     ['assets/images/device.jpeg', 'Device3', '3. ürünün açıklaması'],
  ];

  @override
  void dispose() {
    _pageController.dispose();
    //_settingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_settingController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/images/menu.svg',
              color: const Color(0XFF2A2B2E),
            ),
            splashColor: Colors.white,
            splashRadius: 1.0,
          );
        }),
        title: const Text(
          '',
          style: TextStyle(
            fontFamily: 'Titan One',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0XFF2A2B2E),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0XFFFAFAFA),
        width: 300,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: const EdgeInsets.fromLTRB(30.0, 60.0, 20.0, 30.0),
                  color: const Color.fromARGB(255, 204, 216, 185),
                  //color: const Color.fromARGB(255, 184, 205, 159),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 24.0,
                              child: Icon(BootstrapIcons.person_fill,
                                  color: Color(0XFF8ABA41), size: 24.0),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: const Text(
                                  'Rabia Nur Tünen',
                                  style: TextStyle(
                                    color: Color(0XFF2A2B2E),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'rrabianurtunen@gmail.com',
                                  style: TextStyle(
                                    color: Color(0XFF2A2B2E),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0XFF8ABA41),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(24.0)
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12.0,
                                child: Image(
                                  width: 16,
                                  height: 16,
                                  image: AssetImage(
                                    devicesList[0][0],
                                  ),
                                ),
                              ),
                            ),
                            devicesList.length > 1 
                            ? Container(
                                alignment: Alignment.center,
                                  width: 26,
                                  height: 26,
                                  margin: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF8ABA41),
                                    
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Text(
                                    '+' '${devicesList.length - 1}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                            ) : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  decoration: page == 0
                      ? const BoxDecoration(
                          color: Color.fromARGB(255, 227, 230, 223),
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: 9,
                            ),
                          ),
                        )
                      : const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 9,
                            ),
                          ),
                        ),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(0);
                        page = 0;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            BootstrapIcons.fuel_pump,
                            color: page == 0
                                ? const Color(0XFF8ABA41)
                                : const Color(0XFF2A2B2E),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Devices',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: page == 0
                                  ? const Color(0XFF8ABA41)
                                  : const Color(0XFF2A2B2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  decoration: page == 1
                      ? const BoxDecoration(
                          color: Color.fromARGB(255, 227, 230, 223),
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: 9,
                            ),
                          ),
                        )
                      : const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 9,
                            ),
                          ),
                        ),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(1);
                        page = 1;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            BootstrapIcons.battery_charging,
                            color: page == 1
                                ? const Color(0XFF8ABA41)
                                : const Color(0XFF2A2B2E),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Charge',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: page == 1
                                  ? const Color(0XFF8ABA41)
                                  : const Color(0XFF2A2B2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  decoration: page == 2
                      ? const BoxDecoration(
                          color: Color.fromARGB(255, 227, 230, 223),
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: 9,
                            ),
                          ),
                        )
                      : const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 9,
                            ),
                          ),
                        ),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(2);
                        page = 2;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            BootstrapIcons.calendar_week,
                            color: page == 2
                                ? const Color(0XFF8ABA41)
                                : const Color(0XFF2A2B2E),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Calendar',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: page == 2
                                  ? const Color(0XFF8ABA41)
                                  : const Color(0XFF2A2B2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  decoration: page == 3
                      ? const BoxDecoration(
                          color: Color.fromARGB(255, 227, 230, 223),
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: 9,
                            ),
                          ),
                        )
                      : const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 9,
                            ),
                          ),
                        ),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(3);
                        page = 3;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            BootstrapIcons.map,
                            color: page == 3
                                ? const Color(0XFF8ABA41)
                                : const Color(0XFF2A2B2E),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Map',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: page == 3
                                  ? const Color(0XFF8ABA41)
                                  : const Color(0XFF2A2B2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  decoration: page == 4
                      ? const BoxDecoration(
                          color: Color.fromARGB(255, 227, 230, 223),
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: 9,
                            ),
                          ),
                        )
                      : const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 9,
                            ),
                          ),
                        ),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(4);
                        page = 4;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            BootstrapIcons.person_circle,
                            color: page == 4
                                ? const Color(0XFF8ABA41)
                                : const Color(0XFF2A2B2E),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: page == 4
                                  ? const Color(0XFF8ABA41)
                                  : const Color(0XFF2A2B2E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(36.0, 36.0, 36.0, 48.0),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 59, 97, 2),
                          Color(0XFF8ABA41),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(const AssistantAI());
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BootstrapIcons.headset,
                          color: Colors.white,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Assistant AI',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, 
            (index) {
              return bottomBarPages[index];
            },
          ),
      ),
      onDrawerChanged: (isOpened) {
        isOpened
            ? _scaffoldKey.currentState?.openDrawer()
            : _scaffoldKey.currentState?.closeDrawer();
      },
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar:
          /*Container(
        height: 60,
        margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 48.0),
        decoration: const BoxDecoration(
          color: Color(0XFFEAEBEC),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: activePage == 0 ? const Color(0XFF8ABA41) : const Color(0XFF2A2B2E),
              iconSize: 54,
              onPressed: () {
                activePage = 0;
                _pageController.jumpToPage(0);
                _pageController.animateTo(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
                //_settingController.reset();
                //_settingController.forward();
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Lottie.asset(
                      Icons8.home_2, 
                      //controller: _settingController,
                    ),
              ),
            ),
            IconButton(
              splashRadius: 1,
              iconSize: 54,
              onPressed: () {
                activePage = 1;
                //_settingController.reset();
                //_settingController.forward();
                _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Lottie.asset(
                      Icons8.charging_battery, 
                      //controller: _settingController,
                    ),
              ),
            ),
            IconButton(
              splashRadius: 1,
              iconSize: 54,
              onPressed: () {
                activePage = 2;
                //_settingController.reset();
                //_settingController.forward();
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Lottie.asset(
                      Icons8.calendar, 
                      //controller: _settingController,
                    ),
              ),
            ),
            IconButton(
              splashRadius: 1,
              iconSize: 54,
              onPressed: () {
                activePage = 3;
                //_settingController.reset();
                //_settingController.forward();
                _pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Lottie.asset(
                      Icons8.map_marker, 
                      //controller: _settingController,
                    ),
              ),
            ),
            IconButton(
              splashRadius: 1,
              iconSize: 54,
              onPressed: () {
                activePage = 4;
                //_settingController.reset();
                //_settingController.forward();
                _pageController.animateToPage(
                  4,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                    Lottie.asset(
                      Icons8.login, 
                      //controller: _settingController,
                    ),
              ),
            ),
          ],
        ),
      ),*/
          Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: AnimatedNotchBottomBar(
          pageController: _pageController,
          color: Colors.white,
          showLabel: false,
          notchColor: Colors.white,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                BootstrapIcons.fuel_pump,
                color: Color(0XFF71717A),
              ),
              activeItem: Icon(
                BootstrapIcons.fuel_pump,
                color: Color(0XFF8ABA41),
              ),
            ),
            BottomBarItem(
                inActiveItem: Icon(
                  BootstrapIcons.battery_charging,
                  color: Color(0XFF71717A),
                ),
                activeItem: Icon(
                  BootstrapIcons.battery_charging,
                  color: Color(0XFF8ABA41),
                )),
            BottomBarItem(
              inActiveItem: Icon(
                BootstrapIcons.calendar_week,
                color: Color(0XFF71717A),
              ),
              activeItem: Icon(
                BootstrapIcons.calendar_week,
                color: Color(0XFF8ABA41),
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                BootstrapIcons.map,
                color: Color(0XFF71717A),
              ),
              activeItem: Icon(
                BootstrapIcons.map,
                color: Color(0XFF8ABA41),
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                BootstrapIcons.person_circle,
                color: Color(0XFF71717A),
              ),
              activeItem: Icon(
                BootstrapIcons.person_circle,
                color: Color(0XFF8ABA41),
              ),
            ),
          ],
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
            setState(() {
              page = index;
            });
          },
        ),
      ),
    );
  }
}
