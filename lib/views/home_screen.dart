import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_monhoc/views/components/drawer_menu.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:flutter/material.dart';

import 'components/weather.dart';
import 'rooms/room_state_info.dart';

/////
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                      children: const [
                        Text(
                          "Xin chào",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          "Mai Nguyễn Hoàng Lộc",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
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
                  children: const [
                    CardRoomState(),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CardRoomState(),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
                MaterialPageRoute(builder: (context) => const Info()),
              );
            },
            icon: const Icon(color: Colors.grey, Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
