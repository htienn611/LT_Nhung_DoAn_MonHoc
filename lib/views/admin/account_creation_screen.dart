import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class account_CreationScreen extends StatefulWidget {
  const account_CreationScreen({super.key});

  @override
  State<account_CreationScreen> createState() => _account_CreationScreenState();
}

class _account_CreationScreenState extends State<account_CreationScreen> {
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
                  Text("ĐĂNG KÝ TÀI KHOẢN",style: TextStyle(color: Colors.blueAccent, fontSize: 30,fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(10)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tên người dùng',hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    )
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                    TextField(
                    decoration: InputDecoration(
                      hintText: 'Số điện thoại',hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                    )
                  ),
                    Padding(padding: EdgeInsets.all(5)),
                    TextField(
                    decoration: InputDecoration(
                      hintText: 'Mật khẩu',hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    )
                  ),
                    Padding(padding: EdgeInsets.all(5)),
                     TextField(
                    decoration: InputDecoration(
                      hintText: 'Nhập lại mật khẩu',hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    )
                  ),
                    Padding(padding: EdgeInsets.all(5)),
                   OutlinedButton(
                  onPressed: () {},
          
                  child: Text(
                    "Đăng kí",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                            minimumSize: MaterialStateProperty.all(Size(150, 50))                       
                          ),
                ),
            ],
          ),
        ),
      ),
      )
    );
  }
}