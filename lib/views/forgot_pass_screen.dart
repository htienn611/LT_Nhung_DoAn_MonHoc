import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class FogotPassScreen extends StatefulWidget {
  const FogotPassScreen({super.key});
  @override
  State<FogotPassScreen> createState() => _FogotPassScreenState();
}

class _FogotPassScreenState extends State<FogotPassScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController OTP = TextEditingController();
  int state = 1;
  String _errorMessage = '';
  String smsCode = " ";

  Future<void> sendOTP(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      // Truy vấn dữ liệu từ collection 'account'
      QuerySnapshot querySnapshot = await firestore.collection('Account').get();
      String key = phoneNumber.contains('@') ? 'Email' : 'Phone';
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        String phoneNumberFromFirebase = document.get(key);
        if (phoneNumber == phoneNumberFromFirebase) {
          await auth.verifyPhoneNumber(
              phoneNumber: phoneNumber,
              verificationCompleted: (PhoneAuthCredential credential) async {
                await auth.signInWithCredential(credential);
              },
              verificationFailed: (FirebaseAuthException e) {
                print("Lỗi gửi mã OTP");
              },
              codeSent: (String verificationId, int? resendToken) async {
                print("Mã OTP được gửi thành công");
                smsCode = " ";
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: smsCode);
                await auth.signInWithCredential(credential);
              },
              codeAutoRetrievalTimeout: (String verificationId) {});
          break;
        }
      }
      _errorMessage = "SĐT không tồn tại trong dữ liệu";
      // Số điện thoại không khớp, thực hiện các hành động bạn muốn ở đây
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(50, 100, 50, 5),
                    child: Column(children: [
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
                        "QUÊN MẬT KHẨU",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          TextField(
                              controller: phone,
                              decoration: InputDecoration(
                                  hintText: state == 1
                                      ? "Nhập Số điện thoại"
                                      : "Nhập mật khẩu mới",
                                  hintStyle: TextStyle(fontSize: 18),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  suffixIcon: state == 1
                                      ? ElevatedButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.fromLTRB(
                                                          0, 20, 0, 20)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)))),
                                          onPressed: () {
                                            sendOTP(phone.text);
                                          },
                                        )
                                      : null)),
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 15, color: Colors.redAccent),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: OTP,
                            decoration: InputDecoration(
                                hintText: state == 1
                                    ? "Nhập mã OTP"
                                    : "Nhập lại mật khẩu",
                                hintStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                suffixIcon: state == 1
                                    ? ElevatedButton(
                                        child: Text(
                                          "Gửi",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.fromLTRB(
                                                    0, 20, 0, 20)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                        onPressed: () {
                                          if (smsCode == OTP.text) {
                                            state != 1;
                                          }
                                        },
                                      )
                                    : null),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 15, color: Colors.redAccent),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (state == 1)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Quay lại",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    state = 2;
                                  });
                                },
                                child: Text(
                                  "Tiếp tục",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                              )
                            ])
                      else if (state == 2)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              state = 1;
                            });
                          },
                          child: Text(
                            "Xác nhận",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        )
                    ])))));
  }
}
