import 'dart:async';
import 'dart:ui' as ui;
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Map({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();
  final searchEditingController = TextEditingController();
  final searchScrollController = ScrollController();

  LatLng initPosition = const LatLng(0, 0);
  LatLng currentLatLng = const LatLng(0.0, 0.0);
  LatLng destinationLatLng = const LatLng(0.0, 0.0);
  LocationPermission permission = LocationPermission.denied;
  Geolocator geolocator = Geolocator();

  List<Marker> markersList = [];
  List<LatLng> positions = [
    const LatLng(37.907012, 32.495559),
    const LatLng(37.949113, 32.498581),
    const LatLng(37.927085, 32.516324),
    const LatLng(37.882495, 32.490526),
    const LatLng(37.856606, 32.471254),
  ];
  List<LatLng> polylineCoordinates = [];
  bool showMarkerDialog = false;
  bool showSearchBar = false;
  String searchWords = '';
  bool showSearchList = false;
  bool menuIconColor = false;
  bool closedShowDialog = false;
  List searchList = ['bjkj', 'jnklk'];

  double cameraPositionZoom = 15.0;

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  generateMarkersList() async {
    final Uint8List markerIcon =
        await getImages('assets/images/marker.png', 150);
    for (int i = 0; i < positions.length; i++) {
      markersList.add(
        Marker(
          markerId: MarkerId('Marker $i'),
          position: positions[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: 'Device ${i + 1}',
          ),
          onTap: () {
            setState(() {
              showMarkerDialog = true;
              cameraPositionZoom = 20.0;
              FocusScope.of(context).unfocus();
              print('lokasyon -----> $i');
              destinationLatLng = positions[i];
              print(destinationLatLng);
              polylineCoordinates = [];
              getPolyPoints();
            });
            print(cameraPositionZoom);
          },
        ),
      );
    }
    if (markersList.length == positions.length) {
      checkPermission();
      getCurrentLocation();
      _currentLocation();
      showSearchBar = true;
    }
  }

  void checkPermission() async {
    permission = await Geolocator.checkPermission();
    generateMarkersList();
  }

  void getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: currentLatLng,
        zoom: 16.0,
      ),
    ));
  }

  bool checkReady(LatLng? x, LocationPermission? y) {
    if (x == initPosition ||
        y == LocationPermission.denied ||
        y == LocationPermission.deniedForever) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> openLocationSettings() async {
    if (await Permission.location.isDenied) {
      showOpenedLocation();
    } else {
      menuIconColor = true;
      generateMarkersList();
    }
  }

  void checkLocationPermission() async {
    final status = await Permission.location.status;
    setState(() {
      if (status.isGranted) {
        openLocationSettings();
      }
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAy8xR-M8GB3RniI6GtySH6bh1eRQ8khlU",
      PointLatLng(currentLatLng.latitude, currentLatLng.longitude),
      PointLatLng(destinationLatLng.latitude, destinationLatLng.longitude),
      travelMode: TravelMode.driving,
      avoidHighways: true,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void updateSearchText(String newValue) {
    setState(() {
      searchWords = newValue;
      searchWords == '' ? showSearchList = false : showSearchList = true;
      print(showSearchList);
      print(searchWords);
    });
  }


  @override
  void initState() {
    openLocationSettings();
    checkLocationPermission();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      openLocationSettings();
      
    }
  }

  @override
  void didChangeDependencies() {
    closedShowDialog ? openLocationSettings() : Null;
    super.didChangeDependencies();
  }

  




  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              widget.scaffoldKey.currentState?.openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/images/menu.svg',
              color: menuIconColor
                  ? const Color(0XFF282A37)
                  : Theme.of(context).highlightColor,
            ),
            splashColor: Colors.transparent,
            splashRadius: 1.0,
          );
        }),
        title: showSearchBar
            ? Container(
                margin: const EdgeInsets.only(top: 6),
                width: MediaQuery.of(context).size.width * 0.75,
                height: 42,
                child: TextFormField(
                  controller: searchEditingController,
                  onTap: () {},
                  onTapOutside: (event) {},
                  onChanged: (value) {
                    setState(() {
                      updateSearchText(value);
                    });
                  },
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
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(
                        BootstrapIcons.search,
                        size: 16,
                        color: Color(0XFF131622),
                      ),
                    ),
                    suffixIconColor: const Color(0XFF282A37),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 0.0, 4.0, 0.0),
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
      body: checkReady(currentLatLng, permission)
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).highlightColor,
                ),
              )
            : SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Container(
                    child: Stack(children: [
                      GoogleMap(
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        polylines: {
                          Polyline(
                            polylineId: const PolylineId("route"),
                            points: polylineCoordinates,
                            color: Colors.red,
                            width: 4,
                            endCap: Cap.buttCap,
                            startCap: Cap.buttCap,
                          ),
                        },
                        initialCameraPosition: CameraPosition(
                          target: currentLatLng,
                          zoom: cameraPositionZoom,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: Set<Marker>.of(markersList),
                      ),
                      showMarkerDialog
                          ? AnimatedPositioned(
                              duration: const Duration(seconds: 4),
                              bottom: 100,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 320,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(16.0)),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.fromLTRB(
                                          0.0, 12.0, 0.0, 18.0),
                                      child: SvgPicture.asset(
                                        'assets/images/line.svg',
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          24.0, 0.0, 24.0, 24.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 24.0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .disabledColor,
                                                borderRadius:
                                                    BorderRadius.circular(16.0)),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0),
                                                child: Text(
                                                  'Car Charging Station',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0),
                                                child: Text(
                                                  '1257 Leaf St, Alabama',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      BootstrapIcons.geo_alt,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 14.0,
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 4.0),
                                                      child: Text(
                                                        '500 m / 10 min',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Connection',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              Text(
                                                'Type 3',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                            'assets/images/line_vertical.svg',
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Per kWh',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              Text(
                                                '€ 1.3',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                          SvgPicture.asset(
                                            'assets/images/line_vertical.svg',
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Parking Fee',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              Text(
                                                '€ 0.7',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      width:
                                          MediaQuery.of(context).size.width * 0.8,
                                      height: 1,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          12.0, 0.0, 12.0, 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          MaterialButton(
                                            elevation: 0,
                                            color:
                                                Theme.of(context).backgroundColor,
                                            splashColor:
                                                Theme.of(context).backgroundColor,
                                            highlightColor:
                                                Theme.of(context).backgroundColor,
                                            onPressed: () {},
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Arrive',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Today 9:30',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Icon(
                                                      BootstrapIcons.chevron_down,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 14.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 90.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                '1h 15m',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                            elevation: 0,
                                            color:
                                                Theme.of(context).backgroundColor,
                                            splashColor:
                                                Theme.of(context).backgroundColor,
                                            highlightColor:
                                                Theme.of(context).backgroundColor,
                                            onPressed: () {},
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Depart',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Today 10:45',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Icon(
                                                      BootstrapIcons.chevron_down,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 14.0,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.8,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.fromLTRB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                0.82,
                                        height: 40,
                                        color: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        splashColor:
                                            Theme.of(context).primaryColor,
                                        highlightColor:
                                            Theme.of(context).primaryColorDark,
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        child: const Text(
                                          'Go To Charger',
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                            color: Color(0XFFFFFDFA),
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ]),
                  ),
                ),
              ),
    
    );
  }

  showOpenedLocation() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              actions: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.018),
                  child: Text(
                    'Can "Evops" use your location?',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        setState(() {
                          openAppSettings();
                          closedShowDialog = true;
                          Navigator.of(context).pop();
                          /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const Home(
                                      selectedIndex: 3,
                                      selectedItemPosition: 3,
                                    )),
                          );*/
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Go to the app's location settings",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Icon(
                            BootstrapIcons.arrow_right,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ))
              ],
            );
          });
        }).then((value) {
      if (closedShowDialog == false) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            openLocationSettings();
          }
        });
      }
    });
  }
}
