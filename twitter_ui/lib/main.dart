import 'package:flutter/material.dart';
import 'package:twitter_ui/model/twitter_item.dart';

import 'widgetParts/app_bar_circle_button.dart';
import 'widgetParts/colored_tab_bar.dart';
import 'widgetParts/twitter_bottom_navigation_bar.dart';
import 'widgetParts/twitter_row.dart';

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

  final items = const [
    TwitterItem('2022/05/05', '最高でした。'),
    TwitterItem('2022/05/02', '濃厚接触者になったのでたくさんコードが書けます。'),
    TwitterItem('2022/05/03', '謎の理論で濃厚接触者じゃないらしい！'),
    TwitterItem('2022/05/02', 'あの名シーンが無料で公開されています。'),
    TwitterItem('2022/05/02', '7日間隔離なの相当面倒だ。'),
    TwitterItem('2022/05/01', '良いコード/悪いコードで学ぶ設計入門書いました。\n読んで感想書きます'),
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
              if (tab.text == 'ツイート') {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    return TwitterRow(items: items, index: index);
                  }),
                );
              }
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
