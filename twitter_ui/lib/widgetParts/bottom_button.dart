import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(
        minHeight: 25,
      ),
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Icon(
        iconData,
        size: 20,
        color: Colors.white24,
      ),
    );
  }
}
