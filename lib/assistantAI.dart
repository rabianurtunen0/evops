import 'package:flutter/material.dart';

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
      body: Container(
        alignment: Alignment.center, 
        child: const Text('Assistant AI')
      ),
    );
  }
}