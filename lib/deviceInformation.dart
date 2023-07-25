import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceInformation extends StatefulWidget {
  const DeviceInformation({super.key});

  @override
  State<DeviceInformation> createState() => _DeviceInformationState();
}

class _DeviceInformationState extends State<DeviceInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            splashColor: Colors.white,
            highlightColor: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              child: const Text(
                'Devices Informations',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}