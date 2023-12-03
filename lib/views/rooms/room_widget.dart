import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_monhoc/views/components/drawer_menu.dart';
import 'package:doan_monhoc/views/rooms/device_state.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class RoomWiget extends StatefulWidget {
  RoomWiget({super.key, required this.title});
  String title;
  bool swFollow = true;
  @override
  State<RoomWiget> createState() => _RoomWigetState();
}

class _RoomWigetState extends State<RoomWiget> {
  //  Future<List<String>> getData() async {
  //   // Lấy dữ liệu từ Firestore
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('your_collection').get();

  //   // Lấy giá trị của trường 'field_name' từ mỗi tài liệu
  //   List<String> data = [];
  //   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
  //     if (documentSnapshot.data().containsKey('field_name')) {
  //       data.add(documentSnapshot['field_name']);
  //     }
  //   }

  //   return data;
  // }
  @override
  Widget build(BuildContext context) {
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
                "Phòng ${widget.title}",
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
                          value: widget.swFollow,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.swFollow = value!;
                            });
                          }),
                    ],
                  ),
                ],
              ),
              const Text(
                "Thiết bị đã kết nối: 4",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
        drawer: DrawerMenu(),
        body: SingleChildScrollView(
          child: Container(
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
                DeviceState(),
                DeviceState(),
                DeviceState(),
                Card(
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
                Card(
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
                )
              ],
            ),
          ),
        ));
  }
}

List<String> lstImg = ["assets/img/logoSmartHome.png", "assets/img/avt.png"];
