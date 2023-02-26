import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'じゃんけん'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '勝ち',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Text(
              '🖐',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Text(
              '✌️',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('🖐'),
                ),
              ],
            )
          ],
        ));
  }
}
