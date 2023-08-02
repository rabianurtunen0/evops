import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const LatLng sourceLocation = LatLng(37.42796133580664, -122.085749655962);
   

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


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
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 14.5,
        )
        
      ),
      
  
    );
  }
 
}