import 'package:flutter/material.dart';

class TwitterBottomNavigationBar extends StatelessWidget {
  const TwitterBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.fixed, // Fixed
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.people_alt_outlined),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.notifications_none),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.mail_outline),
        ),
      ],
    );
  }
}
