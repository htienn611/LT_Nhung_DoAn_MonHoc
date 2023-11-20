import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoomWiget extends StatefulWidget {
  RoomWiget({super.key, required this.title});
  var title;
  @override
  State<RoomWiget> createState() => _RoomWigetState();
}

class _RoomWigetState extends State<RoomWiget> {
  bool swFollow = false;
  bool swLed1 = false;
  bool swLed2 = false;
  bool swLed3 = false;
  bool swLed4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(45), // Điều chỉnh cong của góc dưới
            ),
          ),
          toolbarHeight: 130,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Room A",
                style: TextStyle(fontSize: 35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.thermostat_rounded,
                        size: 45,
                      ),
                      Text(
                        '24 °C',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Theo dõi", style: TextStyle(fontSize: 18)),
                      Switch(
                          value: swFollow,
                          activeColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              swFollow = value!;
                            });
                          }),
                    ],
                  ),
                ],
              ),
              const Text(
                "Thiết bị đã kết nối: 4",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5.5,
                child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/img/avt.png')),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Đèn 1",
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                            value: swLed1,
                            onChanged: (bool? value) {
                              setState(() {
                                swLed1 = value!;
                              });
                            }),
                        Text(
                          "Ngày lắp đặt: 12/10/2023",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Đèn 1",
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                            value: swLed2,
                            onChanged: (bool? value) {
                              setState(() {
                                swLed2 = value!;
                              });
                            }),
                        Text(
                          "Ngày lắp đặt: 12/10/2023",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Đèn 1",
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                            value: swLed3,
                            onChanged: (bool? value) {
                              setState(() {
                                swLed3 = value!;
                              });
                            }),
                        Text(
                          "Ngày lắp đặt: 12/10/2023",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Báo động",
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                            value: swLed4,
                            onChanged: (bool? value) {
                              setState(() {
                                swLed4 = value!;
                              });
                            }),
                        Text(
                          "Ngày lắp đặt: 12/10/2023",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
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
                  child: Container(
                    width: 400,
                    height: 400,
                    color: Colors.amber,
                    child: Text(
                      "Slider",
                      style: TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}