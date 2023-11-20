import 'package:doan_monhoc/views/admin/account_creation_screen.dart';
import 'package:doan_monhoc/views/login_screen.dart';
import 'package:doan_monhoc/views/rooms/room_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppHome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Verdana',
      ),
      home: Scaffold(),
    );
  }
}
