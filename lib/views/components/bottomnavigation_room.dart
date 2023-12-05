import 'package:flutter/material.dart';

import '../../api/model/rooms.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;
  const BottomNav(
      {super.key, required this.currentIndex, required this.onTabTapped,});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
            label: "Living",
            icon: Icon(
              Icons.chair,
              color: Colors.blue,
            )),
        BottomNavigationBarItem(
            label: "Dining",
            icon: Icon(
              Icons.restaurant,
              color: Colors.blue,
            )),
        BottomNavigationBarItem(
            label: "Bed",
            icon: Icon(
              Icons.bed,
              color: Colors.blue,
            )),
        BottomNavigationBarItem(
            label: "W/C",
            icon: Icon(
              Icons.shower,
              color: Colors.blue,
            )),
        BottomNavigationBarItem(
            label: "Yard",
            icon: Icon(
              Icons.grass,
              color: Colors.blue,
            )),
      ],
      onTap: onTabTapped,
    );
  }
}
