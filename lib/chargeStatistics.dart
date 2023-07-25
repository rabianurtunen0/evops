import 'package:flutter/material.dart';
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
          backgroundColor: Theme.of(context).backgroundColor,
          shadowColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          leading: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).iconTheme.color,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Charge Statistics',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ));
  }
}
