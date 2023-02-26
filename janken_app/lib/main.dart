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
  String get result {
    if (randomHand == myHand) {
      return 'あいこ';
    } else if (randomHand == Hand.rock && myHand == Hand.paper ||
        randomHand == Hand.scissors && myHand == Hand.rock ||
        randomHand == Hand.paper && myHand == Hand.scissors) {
      return '勝ち';
    } else {
      return '負け';
    }
  }

  Hand randomHand = Hand.rock;
  Hand myHand = Hand.scissors;
  List<Hand> hands = [Hand.rock, Hand.scissors, Hand.paper];

  void _createRandomHand() {
    hands.shuffle();
    randomHand = hands.first;
  }

  void _didTapRockButton() {
    setState(() {
      _createRandomHand();
      myHand = Hand.rock;
    });
  }

  void _didTapScissorsButton() {
    setState(() {
      _createRandomHand();
      myHand = Hand.scissors;
    });
  }

  void _didTapPaperButton() {
    setState(() {
      _createRandomHand();
      myHand = Hand.paper;
    });
  }

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
              result,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Text(
              randomHand.displayNmae,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Text(
              myHand.displayNmae,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _didTapRockButton,
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: _didTapScissorsButton,
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: _didTapPaperButton,
                  child: const Text('🖐'),
                ),
              ],
            )
          ],
        ));
  }
}

enum Hand {
  rock('✊'),
  scissors('✌️'),
  paper('🖐'),
  ;

  const Hand(this.displayNmae);

  final String displayNmae;
}
