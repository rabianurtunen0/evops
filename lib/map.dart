import 'dart:async';
import 'dart:ui' as ui;
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  LatLng initPosition = const LatLng(0, 0);
  LatLng currentLatLng = const LatLng(0.0, 0.0);
  LatLng destinationLatLng = const LatLng(0.0, 0.0);
  LocationPermission permission = LocationPermission.denied;
  final Completer<GoogleMapController> _controller = Completer();
  PolylinePoints polylinePoints = PolylinePoints();

  void checkPermission() async {
    permission = await Geolocator.checkPermission();
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

  bool showMarkerDialog = false;

  bool showMarkers = false;

  List<Marker> markersList = [];
  final Set<Polyline> _polyline = {};

  List<LatLng> positions = [
    const LatLng(37.907012, 32.495559),
    const LatLng(37.949113, 32.498581),
    const LatLng(37.927085, 32.516324),
    const LatLng(37.882495, 32.490526),
    const LatLng(37.856606, 32.471254),
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  generateMarkers() async {
    for (final location in positions) {
      final Uint8List markerIcon =
          await getImages('assets/images/marker.png', 150);
      final marker = Marker(
          markerId: const MarkerId('xxxxx'),
          position: LatLng(location.latitude, location.longitude),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: const InfoWindow(
            title: 'markerrr',
          ),
          onTap: () {
            showMarkerDialog = true;
            destinationLatLng = LatLng(location.latitude, location.longitude);
            
          });
          print(marker);
      markersList.add(marker);
    }
    print(markersList);
    showMarkers = true;
  }
  

  @override
  void initState() {
    

    getCurrentLocation();
    checkPermission();
    print(currentLatLng);
    generateMarkers();
     _polyline.add(
          Polyline(
            polylineId: PolylineId('1'),
            points: positions,
            color: Colors.green,
          )
      );
    super.initState();
    print(Set<Marker>.of(markersList).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: checkReady(currentLatLng, permission) 
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).highlightColor,
              ),
            )
          : Stack(children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                polylines: _polyline,
                initialCameraPosition:
                    CameraPosition(target: currentLatLng, zoom: 16.0),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(markersList),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 2),
                bottom: 100,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 350,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 18.0),
                        child: SvgPicture.asset(
                          'assets/images/line.svg',
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 24.0),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).disabledColor,
                                  borderRadius: BorderRadius.circular(16.0)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    'Car Charging Station',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    '1257 Leaf St, Alabama',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        BootstrapIcons.geo_alt,
                                        color: Theme.of(context).primaryColor,
                                        size: 14.0,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 4.0),
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
                        margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Connection',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  'Type 3',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/images/line_vertical.svg',
                              color: Theme.of(context).disabledColor,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Per kWh',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '€ 1.3',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/images/line_vertical.svg',
                              color: Theme.of(context).disabledColor,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Parking Fee',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '€ 0.7',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 1,
                        color: Theme.of(context).disabledColor,
                      ),
                      Container(
                        margin:
                            const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              elevation: 0,
                              color: Theme.of(context).backgroundColor,
                              splashColor: Theme.of(context).backgroundColor,
                              highlightColor: Theme.of(context).backgroundColor,
                              onPressed: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arrive',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                                        color: Theme.of(context).primaryColor,
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
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '1h 15m',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            MaterialButton(
                              elevation: 0,
                              color: Theme.of(context).backgroundColor,
                              splashColor: Theme.of(context).backgroundColor,
                              highlightColor: Theme.of(context).backgroundColor,
                              onPressed: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Depart',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Today 10:45',
                                        style:
                                            Theme.of(context).textTheme.bodySmall,
                                      ),
                                      Icon(
                                        BootstrapIcons.chevron_down,
                                        color: Theme.of(context).primaryColor,
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
                        width: MediaQuery.of(context).size.width * 0.82,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.82,
                          height: 42,
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          splashColor: Theme.of(context).primaryColor,
                          highlightColor: Theme.of(context).primaryColorDark,
                          onPressed: () {},
                          child: Text(
                            'Book Charger',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
    );
  }

  void _showModal(value) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 42.0),
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.white,
          );
        });
  }
}
