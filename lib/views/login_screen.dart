import 'dart:io';

import 'package:doan_monhoc/views/forgot_pass_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isRemembered = false;
  bool obscurePassword = true;
  String _errorMessage = '';

  Future<void> _signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: phoneController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('Đăng nhập thành công: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = 'Đăng nhập thất bại: ${e.message}';
      });
    }
  }

  // Future<User?>
  signInWithGoogle() async {
    // await GoogleSignIn().signOut();
    // FirebaseAuth.instance.signOut();
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(user.user!.displayName);
  }

  @override
  Widget build(BuildContext context) {
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
                    //signInWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
}
