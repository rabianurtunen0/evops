import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
  setState(() {
    _currentMapType = _currentMapType == MapType.normal
        ? MapType.satellite
        : MapType.normal;
  });
}


  /*
  late Completer<GoogleMapController> _controller = Completer();

  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }

  //Completer<GoogleMapController> _controller = Completer();

  double latitude = 37.903917;
  double longitude = 32.494688;
  */
/*

  late GoogleMapController mapController;

  bool mapToggle = false;

  var currentLocation;


  Future<Position> getCurrentLocation () async { 
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } 
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location premissions are denied.');
      }
    }

    if(permission == LocationPermission.deniedForever) {
      return Future.error('Location premission are permanently denied, we cannot premission');
    }
    return await Geolocator.getCurrentPosition();
  }


  LatLng getLatLng () {
    getCurrentLocation().then((value) {
      
        print(value);
        latitude = value.latitude;
        longitude = value.latitude;
  
    });
    return LatLng(latitude, longitude);
  }

 */

  @override
  void initState() {
    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width * 0.76,
          height: 48,
          child: TextFormField(
            cursorColor: const Color(0XFF062CEB),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0XFFFAFAFA),
              hintText: 'Search location',
              hintStyle: const TextStyle(
                fontSize: 16.0, 
                color: Color(0XFFD2D2D2),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  'assets/images/search.svg',
                ),
              ),
              contentPadding: 
                  const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Color(0XFFFAFAFA)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFFAFAFA)),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFFAFAFA)),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFFAFAFA)),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
        ),
      ),*/
      backgroundColor: Theme.of(context).backgroundColor,
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 13.0,
          ),
          mapType: _currentMapType,
        ),
    );
  }

  
}
