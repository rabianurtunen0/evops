import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:evops/deviceInformation.dart';
import 'package:evops/home.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {

  static const List<dynamic> devicesList = [
    ['assets/images/device.jpeg', 'Device1', '1. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device2', '2. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device3', '3. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device4', '4. ürünün açıklaması'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Get.to(const Home());
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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
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
            return Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48.0,
                      height: 48.0,
                      child: Image(
                        image: AssetImage(devicesList[index][0]),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    index == 4
                        ? const Text('', style: TextStyle(fontSize: 0.0))
                        : Text(devicesList[index][1]),
                    index == 4
                        ? const Text('', style: TextStyle(fontSize: 0.0))
                        : Text(devicesList[index][2]),
                  ],
                ),
                onPressed: () {
                  Get.to(const DeviceInformation());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

/* ListView.builder(
            itemCount: devicesList.length,
            shrinkWrap: true,
            itemBuilder:(context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Container(
                      width: 48.0,
                      height: 48.0,
                      child: Image(
                        image: AssetImage(devicesList[index][0]),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    title: Text(devicesList[index][1]),
                    subtitle: Text(devicesList[index][2]),
                    trailing: IconButton(
                      icon: SvgPicture.asset('assets/images/chevron-right.svg'), 
                      onPressed: () {
                        Get.to(const DeviceInformation());
                      },
                    ),
                  ),
              );
            },
          ),
          */