import 'package:flutter/material.dart';

import 'widgetParts/AppBarCircleButton.dart';
import 'widgetParts/TwitterBottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyTwitterPage(),
    );
  }
}

class MyTwitterPage extends StatelessWidget {
  const MyTwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'こんぶ@Flutter大学',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'ツイート62,699',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
        leading: const AppBarCircleButton(
          iconData: Icons.west,
        ),
        actions: const [
          AppBarCircleButton(iconData: Icons.search),
        ],
      ),
      body: Center(),
      bottomNavigationBar: const TwitterBottomNavigationBar(),
    );
  }
}
