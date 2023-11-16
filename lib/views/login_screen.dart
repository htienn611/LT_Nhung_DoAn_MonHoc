import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 150, 5, 5),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image(
                    image: AssetImage('assets/img/logoSmartHome.png'),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  "Đăng nhập",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 25),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Số điện thoại',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    ),

                    //suffixIcon : icon nằm cuối
                    //perfixIcon:icon nằm đầu
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: ischecked,
                        onChanged: (bool? value) {
                          setState(() {
                            ischecked = value!;
                          });
                        }),
                    Text("Nhớ mật khẩu")
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(color: Colors.blue),
                    )),
                IconButton(
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                      exit(0);
                    },
                    icon: Icon(Icons.exit_to_app)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
