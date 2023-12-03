import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_monhoc/views/components/drawer_menu.dart';
import 'package:doan_monhoc/views/login_screen.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        print(name.text);
        break;
      }
    }
    setState(() {
      
    });
  }

  void initState() {
    super.initState();
    key = widget.unit.contains('@') ? 'Email' : 'Phone';
    print(key);
    queryData();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print(widget.unit);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.more_vert), // Thay đổi biểu tượng ở đây
        //   onPressed: () {
        //     // Mở Drawer khi biểu tượng được nhấn
        //     _scaffoldKey.currentState?.openDrawer();
        //   },
        // ),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Xin chào! ${name.text}',style: TextStyle(color: Colors.white,fontSize: 18),)],
                    ),
                    IconButton(
                      onPressed: () {
                        // Xử lý khi người dùng nhấn vào biểu tượng thông báo
                      },
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Thông tin thời tiết nhiệt độ
                const CardWeather(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardRoomState(),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardRoomState(),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardRoomState(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
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
            onPressed: null,
            icon: const Icon(color: Colors.grey, Icons.account_box),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Info(unit: widget.unit,)),
              );
            },
            icon: const Icon(color: Colors.grey, Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
