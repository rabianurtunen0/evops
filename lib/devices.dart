import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
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
            ? Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 18.0),
                alignment: Alignment.topCenter,
                child: GridView.builder(
                  itemCount: devicesList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                  ),
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10.0),
                      color:
                          index == 2 ? const Color(0XFF8ABA41) : Colors.white,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        splashColor: const Color.fromARGB(255, 116, 155, 58),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: index == 2
                                  ? const Icon(
                                      BootstrapIcons.plus_lg,
                                      color: Colors.white,
                                    )
                                  : Image(
                                      image: AssetImage(devicesList[index][0]),
                                    ),
                            ),
                            index == 2
                                ? const Text('',
                                    style: TextStyle(fontSize: 0.0))
                                : Text(devicesList[index][1]),
                            index == 2
                                ? const Text('',
                                    style: TextStyle(fontSize: 0.0))
                                : Text(devicesList[index][2]),
                          ],
                        ),
                        onPressed: () {
                          index == 2
                              ? Get.to(const AddDevice())
                              : Get.to(const DeviceInformation());
                        },
                      ),
                    );
                  },
                ))
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
