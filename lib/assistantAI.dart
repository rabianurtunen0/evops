import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssistantAI extends StatefulWidget {
  const AssistantAI({Key? key}) : super(key: key);

  @override
  State<AssistantAI> createState() => _AssistantAIState();
}

class _AssistantAIState extends State<AssistantAI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            splashColor: Colors.white,
            highlightColor: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center, 
          color: Colors.white,
          child: const Text('Assistant AI')
        ),
      ),
    );
  }
}