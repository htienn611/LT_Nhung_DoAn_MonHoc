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
            padding: EdgeInsets.fromLTRB(50, 100, 50, 5),
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
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 30,fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Số điện thoại',hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',hintStyle: TextStyle(fontSize: 18),
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
                    Text("Nhớ mật khẩu",style: TextStyle(fontSize: 18),)
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
          
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                            minimumSize: MaterialStateProperty.all(Size(150, 50))                       
                          ),
                        
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(color: Colors.blue,fontSize: 18),
                    ),
                ),
                IconButton(
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                      exit(0);
                    },
                    icon: Icon(Icons.exit_to_app),iconSize: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
