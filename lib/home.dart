import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/assistantAI.dart';
import 'package:evops/themeService.dart';
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

enum Sky { sun, moon }

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
              color: selectedIndex == 3
                  ? const Color(0XFF282A37)
                  : Theme.of(context).iconTheme.color,
            ),
            splashColor: Colors.transparent,
            splashRadius: 1.0,
          );
        }),
        title: selectedIndex == 3
            ? Container(
                margin: const EdgeInsets.only(top: 9.0),
                width: MediaQuery.of(context).size.width * 0.78,
                height: 42,
                child: TextFormField(
                  cursorColor: const Color(0XFF282A37),
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0XFF131622),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search location',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                    prefixIcon: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          BootstrapIcons.search,
                          size: 16.0,
                        )),
                    prefixIconColor: const Color(0XFF282A37),
                    contentPadding:
                        const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                ),
              )
            : Container(),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width * 0.6,
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
                  padding: const EdgeInsets.fromLTRB(24.0, 96.0, 0.0, 36.0),
                  child: SvgPicture.asset(
                    Theme.of(context).backgroundColor == const Color(0XFF282A37)
                        ? 'assets/images/evops_dark.svg'
                        : 'assets/images/evops_light.svg',
                    width: 152,
                    height: 43.2,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                  decoration: selectedIndex == 0
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: const Border(
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
                              ? Icon(
                                  BootstrapIcons.fuel_pump_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                )
                              : Icon(
                                  BootstrapIcons.fuel_pump,
                                  color: Theme.of(context).highlightColor,
                                  size: 20,
                                ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 2.0, 0.0, 0.0),
                          child: Text(
                            'Devices',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: selectedIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                  decoration: selectedIndex == 1
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: const Border(
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
                              ? Icon(
                                  BootstrapIcons.lightning_charge_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                )
                              : Icon(
                                  BootstrapIcons.lightning_charge,
                                  color: Theme.of(context).highlightColor,
                                  size: 20,
                                ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 2.0, 0.0, 0.0),
                          child: Text(
                            'Charge',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: selectedIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                  decoration: selectedIndex == 2
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: const Border(
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
                              ? Icon(
                                  BootstrapIcons.calendar2_week_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                )
                              : Icon(
                                  BootstrapIcons.calendar2_week,
                                  color: Theme.of(context).highlightColor,
                                  size: 20,
                                ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 2.0, 0.0, 0.0),
                          child: Text(
                            'Calendar',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: selectedIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                  decoration: selectedIndex == 3
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: const Border(
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
                              ? Icon(
                                  BootstrapIcons.map_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                )
                              : Icon(
                                  BootstrapIcons.map,
                                  color: Theme.of(context).highlightColor,
                                  size: 20,
                                ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 2.0, 0.0, 0.0),
                          child: Text(
                            'Map',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: selectedIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                  decoration: selectedIndex == 4
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: const Border(
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
                              ? Icon(
                                  BootstrapIcons.person_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                )
                              : Icon(
                                  BootstrapIcons.person,
                                  color: Theme.of(context).highlightColor,
                                  size: 20,
                                ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 2.0, 0.0, 0.0),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: selectedIndex == 4
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor,
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
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 18.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 0.2,
                    color: Theme.of(context).disabledColor,
                  ))),
                  child: Container(
                    alignment: Alignment.center,
                    child: CupertinoSlidingSegmentedControl<Sky>(
                      backgroundColor: Theme.of(context).cardColor,
                      thumbColor: Theme.of(context).backgroundColor ==
                              const Color(0XFFFFFFFF)
                          ? Colors.white
                          : Color(0XFF131622),
                      groupValue: Theme.of(context).backgroundColor ==
                              const Color(0XFFFFFFFF)
                          ? Sky.sun
                          : Sky.moon,
                      onValueChanged: (Sky? value) {
                        if (value != null) {
                          setState(() {
                            ThemeService().changeThemeMode();
                          });
                        }
                      },
                      children: <Sky, Widget>{
                        Sky.sun: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              BootstrapIcons.brightness_high_fill,
                              size: 18.0,
                              color: Theme.of(context).backgroundColor ==
                                      const Color(0XFFFFFFFF)
                                  ? Color(0XFF131622)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        Sky.moon: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              BootstrapIcons.moon_stars,
                              size: 15.0,
                              color: Theme.of(context).backgroundColor ==
                                      const Color(0XFFFFFFFF)
                                  ? Colors.transparent
                                  : Colors.white,
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(30.0, 18.0, 30.0, 36.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
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
                          color: Color(0XFFFFFDFA),
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Assistant AI',
                            style: TextStyle(
                              fontFamily: 'AvenirNext',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: Color(0XFFFFFDFA),
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
        snakeViewColor: Theme.of(context).primaryColor,
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
            activeIcon: Icon(
              BootstrapIcons.fuel_pump_fill,
              color: Theme.of(context).primaryColor,
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.lightning_charge,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: Icon(
              BootstrapIcons.lightning_charge_fill,
              color: Theme.of(context).primaryColor,
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.calendar2_week,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: Icon(
              BootstrapIcons.calendar2_week_fill,
              color: Theme.of(context).primaryColor,
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.map,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: Icon(
              BootstrapIcons.map_fill,
              color: Theme.of(context).primaryColor,
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.person,
              color: Theme.of(context).iconTheme.color,
              size: 22,
            ),
            activeIcon: Icon(
              BootstrapIcons.person_fill,
              color: Theme.of(context).primaryColor,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
