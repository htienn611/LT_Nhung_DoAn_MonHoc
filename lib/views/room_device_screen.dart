import 'package:doan_monhoc/api/model/data.dart';
import 'package:doan_monhoc/api/model/rooms.dart';
import 'package:doan_monhoc/views/components/bottomnavigation_room.dart';
import 'package:doan_monhoc/views/rooms/room_widget.dart';
import 'package:flutter/material.dart';

class RoomDevice extends StatefulWidget {
  RoomDevice({super.key, required this.idx});
  int idx;
  late Widget page;
  @override
  State<RoomDevice> createState() => _RoomDeviceState();
}

class _RoomDeviceState extends State<RoomDevice> {
  final List<RoomWiget> pages = List.filled(
      0, RoomWiget(room: Room("", false, List.empty(), "")),
      growable: true);
  final List<Room> lstR = Data.lstRoom;
  void loadData() {
    pages.clear();
    for (int i = 0; i < Data.lstRoom.length; i++) {
      setState(() {
        pages.add(RoomWiget(room: Data.lstRoom[i],index: i,));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data.listenToHomePageDataChanges(() {
      setState(() {
        loadData();
      });
    });
  }

  Widget build(BuildContext context) {
    loadData();
    widget.page = pages[widget.idx];
    return Scaffold(
      body: widget.page,
      bottomNavigationBar: BottomNav(
        currentIndex: widget.idx,
        onTabTapped: (int i) {
          setState(() {
            widget.idx = i;
            widget.page = pages[widget.idx];
          });
        },
      ),
    );
  }
}
