import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' hide Marker;
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Map extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Map({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  PermissionStatus? _locationPermission;
  StreamController<bool> _mapUpdateStreamController = StreamController<bool>();
  Geolocator geolocator = Geolocator();
  LatLng currentLatLng = const LatLng(0.0, 0.0);
  LatLng destinationLatLng = const LatLng(0.0, 0.0);

  final searchScrollController = ScrollController();
  final searchEditingController = TextEditingController();

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
  bool menuIconColor = false;
  double cameraPositionZoom = 15.0;
  bool delayed = true;
  bool delayedCircular = true;
  bool searchedPlace = false;

  var uuid = Uuid();
  String _sessionToken = '122344';
  List<dynamic> _searchedPlacesList = [];

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
              searchEditingController.text = '';
              searchedPlace = false;
              destinationLatLng = positions[i];
              polylineCoordinates = [];
              getPolyPoints();
              cameraPositionZoom = 20.0;
              FocusScope.of(context).unfocus();
              showMarkerDialog = true;
            });
          },
        ),
      );
    }
    if (markersList.length == positions.length) {
      showSearchBar = true;
    }
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

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location.status;
    setState(() {
      _locationPermission = status;
    });

    if (status.isGranted) {
      _loadMap();
    }
  }

  void _listenToPermissionChanges() {
    Permission.location.status.then((status) {
      _checkLocationPermission();
    });
  }

  Future<void> _loadMap() async {
    //await Future.delayed(const Duration(milliseconds: 200));
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLatLng = LatLng(position.latitude, position.longitude);
      menuIconColor = true;
      generateMarkersList();
    });
    _mapUpdateStreamController.add(true);
  }

  void _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _checkLocationPermission();
    }
  }

  void placeAutoComplete(String query) {
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": "AIzaSyAy8xR-M8GB3RniI6GtySH6bh1eRQ8khlU",
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _listenToPermissionChanges();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        delayed = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        delayedCircular = false;
      });
    });
    searchEditingController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(searchEditingController.text);
  }

  void getSuggestion(String input) async {
    String apiKey = "AIzaSyAy8xR-M8GB3RniI6GtySH6bh1eRQ8khlU";
    String baseURL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request =
        "$baseURL?input=$input&key=$apiKey&sessionToken=$_sessionToken";

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    print(data);

    if (response.statusCode == 200) {
      setState(() {
        _searchedPlacesList =
            jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void dispose() {
    _mapUpdateStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.006),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.042,
                child: TextFormField(
                  controller: searchEditingController,
                  onTap: () {
                    setState(() {
                      searchEditingController.text.isEmpty
                          ? searchedPlace = false
                          : searchedPlace = true;
                    });
                  },
                  onTapOutside: (event) {
                    setState(() {
                      searchEditingController.text.isEmpty
                          ? searchedPlace = false
                          : searchedPlace = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      searchEditingController.text.isEmpty
                          ? searchedPlace = false
                          : searchedPlace = true;
                    });
                  },
                  cursorColor: const Color(0XFF282A37),
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(12),
                    color: const Color(0XFF131622),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search location',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                    prefixIcon: Icon(
                      BootstrapIcons.search,
                      size: ScreenUtil().setSp(14),
                      color: const Color(0XFF131622),
                    ),
                    suffixIcon: searchEditingController.text.isEmpty
                        ? Container(
                            width: 1.0,
                            height: 1.0,
                          )
                        : IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                searchEditingController.text = '';
                                searchedPlace = false;
                              });
                            },
                            icon: Icon(
                              BootstrapIcons.x_circle_fill,
                              size: ScreenUtil().setSp(14),
                              color: const Color(0XFF131622),
                            ),
                          ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 0.0, 4.0, 0.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              )
            : Container(),
      ),
      body: Center(
        child: StreamBuilder<bool>(
          stream: _mapUpdateStreamController.stream,
          builder: (context, snapshot) {
            return _locationPermission == PermissionStatus.granted
                ? snapshot.hasData && snapshot.data == true
                    ? SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height),
                            child: Container(
                              child: Stack(
                                children: [
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
                                    onMapCreated: (controller) {
                                      setState(() {
                                        _controller =
                                            Completer<GoogleMapController>();
                                        _controller.complete(controller);
                                      });
                                    },
                                    markers: Set<Marker>.of(markersList),
                                  ),
                                  searchedPlace
                                      ? Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.17,
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              0.0,
                                              0.0),
                                          padding: _searchedPlacesList.isEmpty
                                              ? EdgeInsets.zero
                                              : EdgeInsets.fromLTRB(
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.016,
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.008),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      bottom: Radius.circular(
                                                          12.0))),
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            removeBottom: true,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  _searchedPlacesList.length,
                                              itemBuilder: (context, index) {
                                                return MaterialButton(
                                                  onPressed: () {
                                                    setState(() async {
                                                      List<Location> locations =
                                                          await locationFromAddress(
                                                              _searchedPlacesList[
                                                                      index][
                                                                  'description']);
                                                      searchedPlace = false;
                                                      searchEditingController
                                                              .text =
                                                          _searchedPlacesList[
                                                                  index]
                                                              ['description'];
                                                      final GoogleMapController
                                                          controller =
                                                          await _controller
                                                              .future;
                                                      cameraPositionZoom = 12;
                                                      controller.animateCamera(
                                                        CameraUpdate.newLatLng(
                                                            LatLng(
                                                                locations.last
                                                                    .latitude,
                                                                locations.last
                                                                    .longitude)),
                                                      );
                                                    });
                                                  },
                                                  hoverColor:
                                                      const Color(0XFFD4D5D4),
                                                  splashColor:
                                                      const Color(0XFFD4D5D4),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      _searchedPlacesList[index]
                                                          ['description'],
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        color: const Color(
                                                            0XFF131622),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  showMarkerDialog
                                      ? AnimatedPositioned(
                                          duration: const Duration(seconds: 4),
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: 320,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .backgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0)),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              24.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right:
                                                                        24.0),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.18,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.18,
                                                            decoration: BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .disabledColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0)),
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                                child: Text(
                                                                  'Car Charging Station',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize: ScreenUtil()
                                                                        .setSp(
                                                                            13),
                                                                    color: Theme.of(
                                                                            context)
                                                                        .highlightColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                                child: Text(
                                                                  '1257 Leaf St, Alabama',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .displaySmall,
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      BootstrapIcons
                                                                          .geo_alt,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              4.0),
                                                                      child:
                                                                          Text(
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
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Connection',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              11),
                                                                  color: Theme.of(context).highlightColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Type 3',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                            ],
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/images/line_vertical.svg',
                                                            color: Theme.of(
                                                                    context)
                                                                .disabledColor,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Per kWh',
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              11),
                                                                  color: Theme.of(context).highlightColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                '€ 1.3',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall,
                                                              )
                                                            ],
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/images/line_vertical.svg',
                                                            color: Theme.of(
                                                                    context)
                                                                .disabledColor,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Parking Fee',
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              11),
                                                                  color: Theme.of(context).highlightColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                '€ 0.7',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall,
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 12.0),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height: 1,
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          12.0, 0.0, 12.0, 8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          MaterialButton(
                                                            elevation: 0,
                                                            color: Theme.of(
                                                                    context)
                                                                .backgroundColor,
                                                            splashColor: Theme
                                                                    .of(context)
                                                                .backgroundColor,
                                                            highlightColor: Theme
                                                                    .of(context)
                                                                .backgroundColor,
                                                            onPressed: () {},
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Arrive',
                                                                  style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              11),
                                                                  color: Theme.of(context).highlightColor,
                                                                ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Today 9:30',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall,
                                                                    ),
                                                                    Icon(
                                                                      BootstrapIcons
                                                                          .chevron_down,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 90.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                '1h 15m',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              11),
                                                                  color: const Color(
                                                                      0XFFFFFDFA),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          MaterialButton(
                                                            elevation: 0,
                                                            color: Theme.of(
                                                                    context)
                                                                .backgroundColor,
                                                            splashColor: Theme
                                                                    .of(context)
                                                                .backgroundColor,
                                                            highlightColor: Theme
                                                                    .of(context)
                                                                .backgroundColor,
                                                            onPressed: () {},
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Depart',
                                                                  style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              11),
                                                                  color: Theme.of(context).highlightColor,
                                                                ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Today 10:45',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall,
                                                                    ),
                                                                    Icon(
                                                                      BootstrapIcons
                                                                          .chevron_down,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          14.0,
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
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      alignment:
                                                          Alignment.center,
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          4.0, 0.0, 4.0, 0.0),
                                                      child: MaterialButton(
                                                        minWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.82,
                                                        height: 40,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        splashColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                        highlightColor: Theme
                                                                .of(context)
                                                            .primaryColorDark,
                                                        onPressed: () {
                                                          setState(() {});
                                                        },
                                                        child: const Text(
                                                          'Go To Charger',
                                                          style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15.0,
                                                            color: Color(
                                                                0XFFFFFDFA),
                                                            letterSpacing: 1.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    showMarkerDialog = false;
                                                  });
                                                },
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                icon: Icon(
                                                  BootstrapIcons.x_circle_fill,
                                                  size: ScreenUtil().setSp(20),
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            )),
                      )
                    : delayedCircular
                        ? Container()
                        : Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).highlightColor,
                              strokeWidth: 3.0,
                            ),
                          )
                : delayed
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0.0,
                                MediaQuery.of(context).size.height * 0.18,
                                0.0,
                                0.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.48,
                              height: MediaQuery.of(context).size.height * 0.36,
                              child: Lottie.asset(
                                Theme.of(context).backgroundColor ==
                                        const Color(0XFFFFFFFF)
                                    ? 'assets/images/map_light.json'
                                    : 'assets/images/map_dark.json',
                              ),
                            ),
                          ),
                          Text(
                            'Location permission denied!',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.012),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                                  MediaQuery.of(context).size.height * 0.048,
                              child: Material(
                                elevation: 0,
                                borderRadius: BorderRadius.circular(12.0),
                                color: Theme.of(context).cardColor,
                                child: MaterialButton(
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height *
                                      0.048,
                                  splashColor: Theme.of(context).hoverColor,
                                  highlightColor: Theme.of(context).hoverColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _requestLocationPermission();
                                      openAppSettings();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.006),
                                        child: Text(
                                          "Go to the app's settings",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.006),
                                        child: Icon(
                                          BootstrapIcons.arrow_right,
                                          color: Theme.of(context).primaryColor,
                                          size: ScreenUtil().setSp(18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      );
          },
        ),
      ),
    );
  }
}
