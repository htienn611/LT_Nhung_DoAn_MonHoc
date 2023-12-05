import 'package:doan_monhoc/api/model/data.dart';
import 'package:doan_monhoc/api/model/rooms.dart';
import 'package:doan_monhoc/views/components/bottomnavigation_room.dart';
import 'package:doan_monhoc/views/rooms/room_widget.dart';
import 'package:flutter/material.dart';

class RoomDevice extends StatefulWidget {
   RoomDevice({super.key,required this.idx});
  int idx;
  @override
  State<RoomDevice> createState() => _RoomDeviceState();
}

class _RoomDeviceState extends State<RoomDevice> {
  final List<RoomWiget> pages = List.filled(
      0, RoomWiget(room: Room("", false, List.empty()), index: -1,),
      growable: true);
  final List<Room> lstR = Data.lstRoom;
  void loadData() {
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
    loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[widget.idx],
      bottomNavigationBar: BottomNav(
        currentIndex: widget.idx,
        onTabTapped: (int i) {
          setState(() {
            widget.idx = i;
          });
        },
      ),
    );
  }
}
