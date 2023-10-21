import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String count = "0";
  // AppDelegateで設定した名前と一致するイベントチャネルを作成
  static const eventChannel = EventChannel('for_ios_event_channel/for_study');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            count,
            style: const TextStyle(fontSize: 50),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.self_improvement_sharp),
          onPressed: () => countTen(),
        ),
      ),
    );
  }

  void countTen() {
    eventChannel.receiveBroadcastStream().listen((event) {
      if (event is String) {
        setState(() {
          count = event;
        });
      }
    });
  }
}
