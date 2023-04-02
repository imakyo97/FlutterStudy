import 'package:flutter/material.dart';

class AddLifeEventScreen extends StatelessWidget {
  const AddLifeEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ライフイベント追加')),
      body: TextField(),
    );
  }
}
