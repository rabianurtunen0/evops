import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/assistantAI.dart';
import 'package:evops/themeService.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:evops/calendar.dart';
import 'package:evops/charge.dart';
import 'package:evops/devices.dart';
import 'package:evops/profile.dart';
import 'package:evops/map.dart';
import 'package:get/get.dart';

enum Sky { sun, moon }

class Home extends StatefulWidget {
  final int selectedIndex;
  final int selectedItemPosition;
  const Home(
      {Key? key,
      required this.selectedIndex,
      required this.selectedItemPosition})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int selectedIndex;
  late int selectedItemPosition;
  late final _pageController = PageController(initialPage: selectedIndex);
  int maxCount = 5;
  late AnimationController themeController;
  List<Widget> bottomBarPages = [];

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    selectedItemPosition = widget.selectedItemPosition;
    super.initState();
    bottomBarPages = [
      const Devices(),
      const Charge(),
      const Calendar(),
      Map(scaffoldKey: _scaffoldKey),
      const Profile(),
    ];
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
      appBar: selectedIndex != 3
          ? AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.06,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/menu.svg',
                      width: MediaQuery.of(context).size.width * 0.018,
                      height: MediaQuery.of(context).size.height * 0.018,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                );
              }),
            )
          : AppBar(
              toolbarHeight: 0.0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
      drawer: Drawer(
        elevation: 0,
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
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.056,
                      MediaQuery.of(context).size.height * 0.104,
                      0.0,
                      MediaQuery.of(context).size.height * 0.044),
                  child: SvgPicture.asset(
                    Theme.of(context).backgroundColor == const Color(0XFF282A37)
                        ? 'assets/images/evops_dark.svg'
                        : 'assets/images/evops_light.svg',
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.0466,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.0066, 0.0, 0.0),
                  decoration: selectedIndex == 0
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                          ),
                        )
                      : BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.018,
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
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.018,
                              0.0,
                              0.0,
                              0.0),
                          child: selectedIndex == 0
                              ? Icon(
                                  BootstrapIcons.fuel_pump_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: ScreenUtil().setSp(17),
                                )
                              : Icon(
                                  BootstrapIcons.fuel_pump,
                                  color: Theme.of(context).highlightColor,
                                  size: ScreenUtil().setSp(17),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Devices',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(12),
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
                  margin: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.0066, 0.0, 0.0),
                  decoration: selectedIndex == 1
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                          ),
                        )
                      : BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.018,
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
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.018,
                              0.0,
                              0.0,
                              0.0),
                          child: selectedIndex == 1
                              ? Icon(
                                  BootstrapIcons.lightning_charge_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: ScreenUtil().setSp(17),
                                )
                              : Icon(
                                  BootstrapIcons.lightning_charge,
                                  color: Theme.of(context).highlightColor,
                                  size: ScreenUtil().setSp(17),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Charge',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(12),
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
                  margin: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.0066, 0.0, 0.0),
                  decoration: selectedIndex == 2
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                          ),
                        )
                      : BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.018,
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
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.018,
                              0.0,
                              0.0,
                              0.0),
                          child: selectedIndex == 2
                              ? Icon(
                                  BootstrapIcons.calendar2_week_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: ScreenUtil().setSp(17),
                                )
                              : Icon(
                                  BootstrapIcons.calendar2_week,
                                  color: Theme.of(context).highlightColor,
                                  size: ScreenUtil().setSp(17),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Calendar',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(12),
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
                  margin: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.0066, 0.0, 0.0),
                  decoration: selectedIndex == 3
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                          ),
                        )
                      : BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.018,
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
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.018,
                              0.0,
                              0.0,
                              0.0),
                          child: selectedIndex == 3
                              ? Icon(
                                  BootstrapIcons.map_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: ScreenUtil().setSp(17),
                                )
                              : Icon(
                                  BootstrapIcons.map,
                                  color: Theme.of(context).highlightColor,
                                  size: ScreenUtil().setSp(17),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Map',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(12),
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
                  margin: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.0066, 0.0, 0.0),
                  decoration: selectedIndex == 4
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border(
                            left: BorderSide(
                              color: Color(0XFF8ABA41),
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                          ),
                        )
                      : BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.018,
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
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.018,
                              0.0,
                              0.0,
                              0.0),
                          child: selectedIndex == 4
                              ? Icon(
                                  BootstrapIcons.person_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: ScreenUtil().setSp(17),
                                )
                              : Icon(
                                  BootstrapIcons.person,
                                  color: Theme.of(context).highlightColor,
                                  size: ScreenUtil().setSp(17),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(12),
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
                  padding: EdgeInsets.fromLTRB(
                      0.0,
                      MediaQuery.of(context).size.height * 0.012,
                      0.0,
                      MediaQuery.of(context).size.height * 0.018),
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
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: Icon(
                              BootstrapIcons.brightness_high_fill,
                              size: ScreenUtil().setSp(15),
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
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: Icon(
                              BootstrapIcons.moon_stars,
                              size: ScreenUtil().setSp(13),
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
                  height: MediaQuery.of(context).size.height * 0.046,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.066,
                      MediaQuery.of(context).size.height * 0.018,
                      MediaQuery.of(context).size.width * 0.066,
                      MediaQuery.of(context).size.height * 0.042),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(const AssistantAI());
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BootstrapIcons.headset,
                          color: const Color(0XFFFFFDFA),
                          size: ScreenUtil().setSp(17),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.028,
                          ),
                          child: Text(
                            'Assistant AI',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(11),
                              color: const Color(0XFFFFFDFA),
                              letterSpacing: 1.5,
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
              size: ScreenUtil().setSp(18),
            ),
            activeIcon: Icon(
              BootstrapIcons.fuel_pump_fill,
              color: Theme.of(context).primaryColor,
              size: ScreenUtil().setSp(18),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.lightning_charge,
              color: Theme.of(context).iconTheme.color,
              size: ScreenUtil().setSp(18),
            ),
            activeIcon: Icon(
              BootstrapIcons.lightning_charge_fill,
              color: Theme.of(context).primaryColor,
              size: ScreenUtil().setSp(18),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.calendar2_week,
              color: Theme.of(context).iconTheme.color,
              size: ScreenUtil().setSp(18),
            ),
            activeIcon: Icon(
              BootstrapIcons.calendar2_week_fill,
              color: Theme.of(context).primaryColor,
              size: ScreenUtil().setSp(18),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.map,
              color: Theme.of(context).iconTheme.color,
              size: ScreenUtil().setSp(18),
            ),
            activeIcon: Icon(
              BootstrapIcons.map_fill,
              color: Theme.of(context).primaryColor,
              size: ScreenUtil().setSp(18),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.person,
              color: Theme.of(context).iconTheme.color,
              size: ScreenUtil().setSp(20),
            ),
            activeIcon: Icon(
              BootstrapIcons.person_fill,
              color: Theme.of(context).primaryColor,
              size: ScreenUtil().setSp(20),
            ),
          ),
        ],
      ),
    );
  }
}
