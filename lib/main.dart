import 'package:doan_monhoc/firebase_options.dart';
import 'package:doan_monhoc/views/admin/account_creation_screen.dart';
import 'package:doan_monhoc/views/admin/account_management_screen.dart';
import 'package:doan_monhoc/views/components/drawer_menu.dart';
import 'package:doan_monhoc/views/edit_personal_info_screen.dart';
import 'package:doan_monhoc/views/home_screen.dart';
import 'package:doan_monhoc/views/login_screen.dart';
import 'package:doan_monhoc/views/forgot_pass_screen.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:doan_monhoc/views/room_device_screen.dart';
import 'package:doan_monhoc/views/rooms/room_widget.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: LoginScreen()
    );
  }
}
