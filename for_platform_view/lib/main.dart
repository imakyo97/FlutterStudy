import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            height: 88,
            child: NativeView(),
          ),
        ),
      ),
    );
  }
}

class NativeView extends StatelessWidget {
  const NativeView({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'login_text_field';

    final Map<String, dynamic> creationParams = <String, dynamic>{
      'didChangeText': 'test',
    };

    return UiKitView(
      viewType: viewType,
      creationParams:
          creationParams, // create(withFrame:, viewIdentifier, arguments)のargumentsの値になる
      creationParamsCodec:
          const StandardMessageCodec(), // プラットフォーム側に送信する前にcreationParamsをエンコードするために使用されるコーデック。createArgsCodec()の返り値と一致する必要がある
    );
  }
}
