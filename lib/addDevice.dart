import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:evops/deviceInformation.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final _scrollController = ScrollController();
  static const List<dynamic> devicesList = [
    ['assets/images/device.jpeg', 'Device1', '1. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device2', '2. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device3', '3. ürünün açıklaması'],
    ['assets/images/device.jpeg', 'Device4', '4. ürünün açıklaması'],
  ];

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
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
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
        child: Scrollbar(
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
                  color: Theme.of(context).cardColor,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  splashColor: Theme.of(context).hoverColor,
                  highlightColor: Theme.of(context).hoverColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        BootstrapIcons.fuel_pump,
                        size: ScreenUtil().setSp(24),
                        color: Theme.of(context).primaryColor,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.012),
                        child: Text(
                          devicesList[index][1],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.012),
                        child: Text(
                          devicesList[index][2],
                          style: Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Get.to(const DeviceInformation());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
