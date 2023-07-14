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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center, 
        child: Text(
          'Charge',
          style: TextStyle(
            color: Theme.of(context).backgroundColor == const Color(0XFF2A2B2E) ? Colors.white : Colors.black,

          ),
        ),
      ),
    );
  }
}