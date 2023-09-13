import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChargeStatistics extends StatefulWidget {
  const ChargeStatistics({super.key});

  @override
  State<ChargeStatistics> createState() => _ChargeStatisticsState();
}

class _ChargeStatisticsState extends State<ChargeStatistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0.0,
          leading: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: ScreenUtil().setSp(20),
                color: Theme.of(context).iconTheme.color,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Text(
              'Charge Statistics',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ));
  }
}
