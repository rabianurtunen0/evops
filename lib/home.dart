import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/assistantAI.dart';
import 'package:evops/themeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:evops/calendar.dart';
import 'package:evops/charge.dart';
import 'package:evops/devices.dart';
import 'package:evops/profile.dart';
import 'package:evops/map.dart';
import 'package:get/get.dart';
//import 'package:flutter_animated_icons/flutter_animated_icons.dart';
//import 'package:flutter_animated_icons/icons8.dart';
//import 'package:flutter_animated_icons/lottiefiles.dart';
//import 'package:flutter_animated_icons/useanimations.dart';
//import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  int selectedItemPosition = 0;
  late final _pageController = PageController(initialPage: selectedIndex);
  int maxCount = 5;
  late AnimationController themeController;

  final List<Widget> bottomBarPages = [
    const Devices(),
    const Charge(),
    const Calendar(),
    const Map(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    themeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _pageController.dispose();
    themeController.dispose();
    super.dispose();
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
              color: Theme.of(context).iconTheme.color,
            ),
            splashColor: Colors.transparent,
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
        backgroundColor: Colors.white,
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
                  width: MediaQuery.of(context).size.width,
                  height: 225,
                  padding: const EdgeInsets.fromLTRB(30.0, 60.0, 20.0, 30.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 171, 183, 156),
                        Color(0XFF8ABA41),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 40.0),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'rrabianurtunen@gmail.com',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 241, 244, 238),
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
                        child: IconButton(
                          icon: Theme.of(context).backgroundColor == Colors.white
                          ? const Icon(
                            BootstrapIcons.brightness_high_fill,
                            color: Colors.white,
                            size: 22,
                          ) : const Icon(
                            BootstrapIcons.moon_stars_fill,
                            color: Colors.white,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              ThemeService().changeThemeMode();
                            });

                          },
                        ),
                        /*IconButton(
                          iconSize: 40.0,
                          onPressed: () {
                            if (themeController.status ==
                                AnimationStatus.dismissed) {
                              themeController.reset();
                              themeController.animateTo(0.6);
                            } else {
                              themeController.reverse();
                            }
                          },
                          icon: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 0.0, 0.0, 12.0),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                        Colors.red,
                        BlendMode.modulate,
                      ),
                              child: Lottie.asset(
                                Icons8.day_night_weather,
                                controller: themeController,
                                delegates: LottieDelegates(
                                  values: [
                                    ValueDelegate.color(
                                      const ['**', 'wave_2 Outlines', '**'],
                                      value: Color(0xff179977),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ),
                        ),*/
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  decoration: selectedIndex == 0
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
                        selectedIndex = 0;
                        selectedItemPosition = 0;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: selectedIndex == 0 
                          ? const Icon(
                              BootstrapIcons.fuel_pump_fill,
                              color: Color(0XFF8ABA41),  
                              size: 20,
                            )
                          : const Icon(
                            BootstrapIcons.fuel_pump,
                            color: Color(0XFF2A2B2E),
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
                              color: selectedIndex == 0
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
                  decoration: selectedIndex == 1
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
                        selectedIndex = 1;
                        selectedItemPosition = 1;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: selectedIndex == 1 
                          ? const Icon(
                              BootstrapIcons.lightning_charge_fill,
                              color: Color(0XFF8ABA41),  
                              size: 20,
                            )
                          : const Icon(
                            BootstrapIcons.lightning_charge,
                            color: Color(0XFF2A2B2E),
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
                              color: selectedIndex == 1
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
                  decoration: selectedIndex == 2
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
                        selectedIndex = 2;
                        selectedItemPosition = 2;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: selectedIndex == 2 
                          ? const Icon(
                              BootstrapIcons.calendar2_week_fill,
                              color: Color(0XFF8ABA41),  
                              size: 20,
                            )
                          : const Icon(
                            BootstrapIcons.calendar2_week,
                            color: Color(0XFF2A2B2E),
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
                              color: selectedIndex == 2
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
                  decoration: selectedIndex == 3
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
                        selectedIndex = 3;
                        selectedItemPosition = 3;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: selectedIndex == 3 
                          ? const Icon(
                              BootstrapIcons.map_fill,
                              color: Color(0XFF8ABA41),  
                              size: 20,
                            )
                          : const Icon(
                            BootstrapIcons.map,
                            color: Color(0XFF2A2B2E),
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
                              color: selectedIndex == 3
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
                  decoration: selectedIndex == 4
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
                        selectedIndex = 4;
                        selectedItemPosition = 4;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                          child: selectedIndex == 4 
                          ? const Icon(
                              BootstrapIcons.person_fill,
                              color: Color(0XFF8ABA41),  
                              size: 20,
                            )
                          : const Icon(
                            BootstrapIcons.person,
                            color: Color(0XFF2A2B2E),
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
                              color: selectedIndex == 4
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
                  margin: const EdgeInsets.all(36.0),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                        Color(0XFF8ABA41),
                        Color.fromARGB(255, 171, 183, 156),
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
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Theme.of(context).backgroundColor,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        snakeViewColor: const Color(0XFF8ABA41),
        currentIndex: selectedItemPosition,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            selectedItemPosition = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.fuel_pump,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: const Icon(
              BootstrapIcons.fuel_pump_fill,
              color: Color(0XFF8ABA41),
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.lightning_charge,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: const Icon(
              BootstrapIcons.lightning_charge_fill,
              color: Color(0XFF8ABA41),
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.calendar2_week,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: const Icon(
              BootstrapIcons.calendar2_week_fill,
              color: Color(0XFF8ABA41),
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.map,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: const Icon(
              BootstrapIcons.map_fill,
              color: Color(0XFF8ABA41),
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.person,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: const Icon(
              BootstrapIcons.person_fill,
              color: Color(0XFF8ABA41),
              size: 22,
            ),
          ),
        ],
      ),
      /*
      bottomNavigationBar:
        
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
      ),*/
    );
  }
}
