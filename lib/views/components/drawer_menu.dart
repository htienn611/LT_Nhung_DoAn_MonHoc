import 'package:doan_monhoc/views/home_screen.dart';
import 'package:doan_monhoc/views/login_screen.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:doan_monhoc/views/room_device_screen.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(56),
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Smart Home",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Trang chủ"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.chair_alt),
              title: const Text("Danh sách phòng"),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.chair),
                      title: const Text("Phòng khách"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoomDevice()));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.restaurant),
                      title: const Text("Phòng ăn"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.bed),
                      title: const Text("Phòng ngủ"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.shower),
                      title: const Text("Phòng vệ sinh"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.grass),
                      title: const Text("Khu vực sân"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Tài khoản"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Info()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Đăng xuất"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
