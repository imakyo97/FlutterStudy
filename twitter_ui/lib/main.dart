import 'package:flutter/material.dart';

import 'widgetParts/AppBarCircleButton.dart';
import 'widgetParts/ColoredTabBar.dart';
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

  final tabs = const [
    Tab(text: 'ツイート'),
    Tab(text: 'ツイートと返信'),
    Tab(text: 'メディア'),
    Tab(text: 'いいね'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
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
          bottom: ColoredTabBar(
            color: const Color.fromARGB(255, 25, 25, 25),
            tabBar: TabBar(
              isScrollable: true,
              tabs: tabs,
              indicatorColor: Colors.cyan,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ...tabs.map((tab) {
              return Center(
                child: Text(
                  tab.text!,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList()
          ],
        ),
        bottomNavigationBar: const TwitterBottomNavigationBar(),
      ),
    );
  }
}
