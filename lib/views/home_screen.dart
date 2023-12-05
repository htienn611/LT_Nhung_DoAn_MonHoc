import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_monhoc/api/model/data.dart';
import 'package:doan_monhoc/views/components/drawer_menu.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../api/model/rooms.dart';
import 'components/weather.dart';
import 'rooms/room_state_info.dart';

/////
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.unit});
  String unit;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var key;
TextEditingController name = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  void queryData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Account').get();
    List<QueryDocumentSnapshot> lstDoc = querySnapshot.docs;
    for (var element in lstDoc) {
      if (element[key] == widget.unit) {
        name.text = element['Name'];
        break;
      }
    }
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Room> lstR = List.filled(0, Room("", true, List.empty(),""));
  void loadData() async {
    Data.loadData().then((value) {
      setState(() {
        lstR = Data.lstRoom;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    key = widget.unit.contains('@') ? 'Email' : 'Phone';

    queryData();
    loadData();
    Data.listenToHomePageDataChanges(() {
      // Phương thức này được gọi khi có sự thay đổi dữ liệu và widget cần được làm mới
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(size: 25.0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "TRANG CHỦ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/img/logoSmartHome.png"),
              ),
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
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Xin chào! ${name.text}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              // Thông tin thời tiết nhiệt độ
              Expanded(
                flex: 4,
                child: const CardWeather(),
              ),
              Expanded(
                flex: 7,
                child: ListView.builder(
                    itemCount: lstR.length,
                    itemBuilder: (context, index) {
                      return lstR[index].follow
                          ? CardRoomState(
                              room: lstR[index],
                            )
                          : Text("");
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        height: 50,
        items: [
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.home, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(this.context);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Info(
                          unit: widget.unit,
                        )),
              );
            },
            icon: const Icon(color: Colors.grey, Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
