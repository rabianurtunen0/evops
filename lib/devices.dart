import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:evops/addDevice.dart';
import 'package:evops/deviceInformation.dart';

class Devices extends StatefulWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  final _scrollController = ScrollController();
  static const List<dynamic> devicesList = [
    ['assets/images/device.jpeg', 'Device1', '1. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device2', '2. ürünün açıklaması'],
    ['', 'New', 'Device']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: devicesList.isNotEmpty
            ? Scrollbar(
              controller: _scrollController,
              thickness: 5,
              radius: const Radius.circular(20.0),
              scrollbarOrientation: ScrollbarOrientation.right,
              child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.014,
                      horizontal: MediaQuery.of(context).size.width * 0.056),
                  alignment: Alignment.topCenter,
                  child: GridView.builder(
                    itemCount: devicesList.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    ),
                    itemBuilder: (context, index) {
                      return MaterialButton(
                        elevation: 3,
                        color: index == 2
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor,
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        splashColor: index == 2 ? Theme.of(context).primaryColorDark : Theme.of(context).hoverColor,
                        highlightColor: index == 2 ? Theme.of(context).primaryColorDark : Theme.of(context).hoverColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            index == 2
                                ? Icon(
                                    BootstrapIcons.plus_lg,
                                    size: ScreenUtil().setSp(24),
                                    color: Colors.white,
                                  )
                                : Icon(
                                    BootstrapIcons.fuel_pump,
                                    size: ScreenUtil().setSp(24),
                                    color: Theme.of(context).primaryColor,
                                  ),
                            index == 2
                                ? const Text('', style: TextStyle(fontSize: 0.0))
                                : Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.012),
                              child: Text(
                                devicesList[index][1],
                                style: Theme.of(context).textTheme.titleMedium,
                              )),
                            index == 2
                                ? const Text('', style: TextStyle(fontSize: 0.0))
                                : Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.012),
                              child: Text(
                                devicesList[index][2],
                                style: Theme.of(context).textTheme.displaySmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          index == 2
                              ? Get.to(const AddDevice())
                              : Get.to(const DeviceInformation());
                        },
                      );
                    },
                  )),
            )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    child: const Image(
                      image: AssetImage('assets/images/charging_station_1.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: const Text(
                      'No added device',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color(0XFF2A2B2E),
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF8ABA41),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Get.to(const AddDevice());
                      },
                      child: const Text(
                        'Add device',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
