import 'package:flutter/material.dart';

class AddLifeEventScreen extends StatelessWidget {
  AddLifeEventScreen({super.key});

  final eventNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() {
        Navigator.pop(context, eventNameController.text);
        return Future.value(false);
      }),
      child: Scaffold(
        appBar: AppBar(title: const Text('ライフイベント追加')),
        body: TextField(
          controller: eventNameController,
        ),
      ),
    );
  }
}
