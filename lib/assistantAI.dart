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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        shadowColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center, 
          child: const Text('Assistant AI')
        ),
      ),
    );
  }
}