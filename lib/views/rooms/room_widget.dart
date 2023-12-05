import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_monhoc/api/model/devices.dart';
import 'package:doan_monhoc/views/components/drawer_menu.dart';
import 'package:doan_monhoc/views/rooms/device_state.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../api/model/rooms.dart';

// ignore: must_be_immutable
class RoomWiget extends StatefulWidget {
  RoomWiget({super.key, required this.room,required this.index});
  Room room;
  int index;
  @override
  State<RoomWiget> createState() => _RoomWigetState();
}

class _RoomWigetState extends State<RoomWiget> {
  @override
  Widget build(BuildContext context) {
    // final List<DeviceState> devices = List.filled(
    //     0, DeviceState(dv: Device("", false, 0, "")),
    //     growable: true);
    // final List<Device> lstR = widget.room.lstDevice;
    // for (int i = 0; i < lstR.length; i++) {
    //   setState(() {
    //     devices.add(DeviceState(dv: widget.room.lstDevice[i]));
    //   });
    // }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 130,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.room.name,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.thermostat_rounded,
                        size: 45,
                        color: Colors.red,
                        //color: double.parse(temperature) <20?Colors.blue:(double.parse(temperature)<26?Colors.amber:Colors.red),
                      ),
                      Text(
                        '24 °C',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Theo dõi",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                      Switch(
                          value: widget.room.follow,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.room.follow = value!;
                            });
                          }),
                    ],
                  ),
                ],
              ),
              Text(
                "Thiết bị đã kết nối: ${widget.room.lstDevice.length.toString()}",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
        drawer: DrawerMenu(),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                  child: ListView.builder(
                      itemCount: widget.room.lstDevice.length,
                      itemBuilder: (context, i) {
                        return DeviceState(dv: widget.room.lstDevice[i],indexRoom: widget.index,indexDv: i);
                      })),
              Expanded(
                flex: 1,
                child: Card(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Text(
                          "Diện tích: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "12m2",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                  child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Hình ảnh phòng:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 10,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(autoPlay: true),
                        itemCount: lstImg.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            SizedBox(child: Image.asset(lstImg[itemIndex])),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}

List<String> lstImg = ["assets/img/logoSmartHome.png", "assets/img/avt.png"];
