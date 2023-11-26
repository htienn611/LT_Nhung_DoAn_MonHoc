import 'package:doan_monhoc/views/components/bottomnavigation_room.dart';
import 'package:doan_monhoc/views/rooms/room_widget.dart';
import 'package:flutter/material.dart';

class RoomDevice extends StatefulWidget {
  const RoomDevice({super.key});
  @override
  State<RoomDevice> createState() => _RoomDeviceState();
}

class _RoomDeviceState extends State<RoomDevice> {
  int currentIndex = 0;
  final List<RoomWiget> pages = [
    RoomWiget(title: "Khách"),
    RoomWiget(title: "Ăn"),
    RoomWiget(title: "Ngủ"),
    RoomWiget(title: "Vệ sinh"),
    RoomWiget(title: "Sân"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTabTapped: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
