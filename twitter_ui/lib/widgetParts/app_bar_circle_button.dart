import 'package:flutter/material.dart';

class AppBarCircleButton extends StatelessWidget {
  const AppBarCircleButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    // AppBar内では高さや横幅が制限されており、うまくサイズを調整できない
    // Containerで囲んで、marginを設定することでサイズを調整
    // https://qiita.com/ryoya-cre8tor/items/338d357123188ac89145
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(200, 30, 30, 30),
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: Icon(
          iconData,
          size: 20,
        ),
        onPressed: () {},
      ),
    );
  }
}
