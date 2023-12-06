import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_monhoc/views/forgot_pass_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/model/data.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

CollectionReference _referenceAccountList =
    FirebaseFirestore.instance.collection('Account');
late Stream<QuerySnapshot> _streamAccountItems;

class LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isRemembered = false;
  bool obscurePassword = true;
  String _errorMessage = '';
  bool loginsucces = false;
  Future<void> _signIn(String phoneNumber, String Password) async {
    // Kết nối đến Firebase
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Truy vấn dữ liệu từ collection 'account'
      QuerySnapshot querySnapshot = await firestore.collection('Account').get();
      String key = phoneNumber.contains('@') ? 'Email' : 'Phone';
      // Duyệt qua từng document trong collection
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        // Lấy dữ liệu từ field 'sdt' trong mỗi document
        // print(document.get(field));

        String phoneNumberFromFirebase = document.get(key);
        // print(phoneNumber+" "+phoneNumberFromFirebase);
        String passwordFromFirebase = document.get('Password');
        // So sánh với số điện thoại nhập từ ứng dụng
        if (phoneNumber == phoneNumberFromFirebase &&
            Password == passwordFromFirebase) {
          loginsucces = true;
          break;
        }
      }
      _errorMessage = "Nhập sai SĐT/email hoặc mật khẩu";
      // Số điện thoại không khớp, thực hiện các hành động bạn muốn ở đây
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
      loginsucces = false;
    }
  }

  // Future<User?> signInWithGoogle() async {
  //   await GoogleSignIn().signOut();
  //   FirebaseAuth.instance.signOut();
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //   UserCredential user =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(user.user!.displayName);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    //print("a");
    //Data.test();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 5),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: const Image(
                    image: AssetImage('assets/img/logoSmartHome.png'),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                const Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Email/Số điện thoại',
                    hintStyle: const TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                TextField(
                  controller: passwordController,
                  obscureText: obscurePassword, // ẩn hiện mật khẩu
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    hintStyle: const TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword =
                              !obscurePassword; //thực hiện chức năng ẩn hiện
                        });
                      },
                      tooltip:
                          obscurePassword ? "Hiện mật khẩu" : "Ẩn mật khẩu",
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isRemembered,
                      onChanged: (bool? value) {
                        setState(() {
                          _isRemembered = value!;
                        });
                      },
                    ),
                    const Text(
                      "Nhớ mật khẩu",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _signIn(phoneController.text, passwordController.text)
                        .then((value) {
                      loginsucces == true
                          ? [
                              Navigator.pop(context),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            unit: phoneController.text,
                                          )))
                            ]
                          : "";
                    });
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                  ),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  _errorMessage,
                  style: const TextStyle(fontSize: 15, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FogotPassScreen()));
                  },
                  child: const Text(
                    "Quên mật khẩu",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Thoát ứng dụng khi nhấn nút exit
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    exit(0);
                  },
                  icon: const Icon(Icons.exit_to_app),
                  iconSize: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    _streamAccountItems = _referenceAccountList.snapshots();
  }
}
