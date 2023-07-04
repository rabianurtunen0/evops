import 'package:flutter/material.dart';

class Charge extends StatefulWidget {
  const Charge({Key? key}) : super(key: key);

  @override
  State<Charge> createState() => _ChargeState();
}

class _ChargeState extends State<Charge> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFAFAFA),
      body: Container(
        alignment: Alignment.center, 
        child: const Text('Charge')
      ),
    );
  }
}