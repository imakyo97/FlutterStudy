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
  String centerMessage = 'Hello World!';
  // AppDelegateで設定した名前と一致するmethodChannelを作成
  static const methodChannel =
      MethodChannel('for_ios_method_channel/for_study');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(centerMessage),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.self_improvement_sharp),
          onPressed: () => callGoodByeWorld(),
        ),
      ),
    );
  }

  // methodChannelで関数を呼び出し、結果を画面に表示
  Future<void> callGoodByeWorld() async {
    String result = '';
    try {
      result = await methodChannel.invokeMethod('goodbyeWorld');
    } on PlatformException catch (e) {
      result = e.message ?? 'error';
    }

    setState(() {
      centerMessage = result;
    });
  }
}
