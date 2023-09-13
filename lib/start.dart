import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/charge-station.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.055,
                        MediaQuery.of(context).size.height * 0.055,
                        0.0,
                        0.0),
                    child: SvgPicture.asset(
                      Theme.of(context).backgroundColor ==
                              const Color(0XFF282A37)
                          ? 'assets/images/evops_dark.svg'
                          : 'assets/images/evops_light.svg',
                      width: 190,
                      height: MediaQuery.of(context).size.height * 0.058,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.066,
                        MediaQuery.of(context).size.height * 0.033,
                        MediaQuery.of(context).size.width * 0.066,
                        0.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Green Power',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(18),
                          color: Theme.of(context).primaryColor,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: " ‘Evops’ Charging Station for EVs",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(18),
                              color: Theme.of(context).highlightColor,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.066,
                        MediaQuery.of(context).size.height * 0.022,
                        0.0,
                        0.0),
                    padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
                    //width: MediaQuery.of(context).size.width * 0.16,
                    //height: MediaQuery.of(context).size.width * 0.08,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      BootstrapIcons.arrow_right,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
