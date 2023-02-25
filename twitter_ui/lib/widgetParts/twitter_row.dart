import 'package:flutter/material.dart';
import 'package:twitter_ui/model/twitter_item.dart';

import 'bottom_button.dart';

class TwitterRow extends StatelessWidget {
  const TwitterRow({
    Key? key,
    required this.items,
    required this.index,
  }) : super(key: key);

  final List<TwitterItem> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.white10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/myIcon.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'こんぶ@Flutter大学',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        items[index].date,
                        style: const TextStyle(
                          color: Colors.white24,
                        ),
                      )
                    ],
                  ),
                  Text(
                    items[index].message,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BottomButton(iconData: Icons.chat_outlined),
                      BottomButton(iconData: Icons.repeat_outlined),
                      BottomButton(iconData: Icons.favorite_outline),
                      BottomButton(iconData: Icons.ios_share_outlined),
                      BottomButton(iconData: Icons.bar_chart_outlined),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
