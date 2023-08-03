import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
 
  
  late GoogleMapController mapController;

  bool mapToggle = false;

  var currentLocation;

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((current_location) {
      setState(() {
        currentLocation = current_location;
        mapToggle = true;
      });
    });
    
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
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.903784, 32.494618),
                  //target: LatLng(currentLocation.latitude, currentLocation.longitude),
                  zoom: 18.0,
                ),
                onMapCreated: onMapCreated,
               
              
              ),
           
            );
  }


  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }




}
