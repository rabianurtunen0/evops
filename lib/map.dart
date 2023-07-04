import 'package:flutter/material.dart';


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {

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
      backgroundColor: Color(0XFFFAFAFA),
      body: Container(
        margin: const EdgeInsets.only(top: 6.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/map.png'),
              fit: BoxFit.cover),
        ),
        /*child: Stack(
          children: [
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 30.0),
                width: MediaQuery.of(context).size.width,
                height: 444,
                decoration: const BoxDecoration(
                  color: Color(0XFFFAFAFA),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}