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
            DrawerHeader(
              padding: EdgeInsets.all(65),
              child: Text(
                "Mart Home",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Trang chủ"),
            ),
            ListTile(
              leading: Icon(Icons.chair_alt),
              title: Text("Danh sách phòng"),
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
                  children: const [
                    ListTile(
                      leading: Icon(Icons.chair),
                      title: Text("Phòng khách"),
                    ),
                    ListTile(
                      leading: Icon(Icons.restaurant),
                      title: Text("Phòng ăn"),
                    ),
                    ListTile(
                      leading: Icon(Icons.bed),
                      title: Text("Phòng ngủ"),
                    ),
                    ListTile(
                      leading: Icon(Icons.shower),
                      title: Text("Phòng vệ sinh"),
                    ),
                    ListTile(
                      leading: Icon(Icons.grass),
                      title: Text("Khu vực sân"),
                    ),
                  ],
                ),
              ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Tài khoản"),
            ),
          ],
        ),
      ),
    );
  }
}
