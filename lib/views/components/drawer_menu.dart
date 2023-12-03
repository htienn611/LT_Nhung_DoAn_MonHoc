import 'package:doan_monhoc/views/home_screen.dart';
import 'package:doan_monhoc/views/login_screen.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:doan_monhoc/views/room_device_screen.dart';
import 'package:flutter/material.dart';
class YesNoDialog extends StatelessWidget {
  final String title;
  final String content;

  YesNoDialog({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        // Nút "Có"
        TextButton(
          onPressed: () {
            // Xử lý khi người dùng chọn "Có"
            Navigator.of(context).pop(true);
          },
          child: Text('Có'),
        ),
        // Nút "Không"
        TextButton(
          onPressed: () {
            // Xử lý khi người dùng chọn "Không"
            Navigator.of(context).pop(false);
          },
          child: Text('Không'),
        ),
      ],
    );
  }
}
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
              onTap: () async {
                 bool result = await showDialog(
                context: context,
                builder: (context) => YesNoDialog(
                  title: 'Xác nhận',
                  content: 'Bạn có chắc chắn muốn thoát?',
                ),
              );

              // Xử lý kết quả từ hộp thoại
              if (result == true) {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              } else {
                
              }
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
