import 'package:flutter/material.dart';
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
                            hintText: "Nhập Số điện thoại",
                            hintStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: ElevatedButton(
                              child: Text(
                                "OK",
                                style: TextStyle(fontSize: 18),
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(0, 20, 0, 20)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {},
                            )),
                      ),
                      Text("",style: TextStyle(fontSize: 15,color: Colors.redAccent),),
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
                            hintText: "Nhập mã OTP",
                            hintStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: ElevatedButton(
                              child: Text(
                                "Gửi",
                                style: TextStyle(fontSize: 18),
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(0, 20, 0, 20)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {},
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("",style: TextStyle(fontSize: 15,color: Colors.redAccent),),

                        ],
                      ),
                      
                      SizedBox(
                        height: 20,
                      ),
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
                          onPressed: () {},
                          child: Text(
                            "Thoát",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        )
                      ])
                    ])))));
  }
}
