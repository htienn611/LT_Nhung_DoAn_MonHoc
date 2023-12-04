import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class EditPersonalInfo extends StatefulWidget {
  EditPersonalInfo({super.key, required this.id});
  String id;
  var data = null;

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  var key;
  String? groupValue;
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController birthday = TextEditingController();

  Future<String?> queryData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Account').get();
    List<QueryDocumentSnapshot> lstDoc = querySnapshot.docs;
    String? idElement;
    for (var element in lstDoc) {
      if (element[key] == widget.id) {
        name.text = element['Name'];
        email.text = element['Email'];
        phone.text = element['Phone'];
        birthday.text = element['Birthday'];
        groupValue = element['Sex'];
        idElement = element.id;
        break;
      }
    }
    print(idElement);
    return idElement.toString();
  }

  @override
  void initState() {
    super.initState();
    key = widget.id.contains('@') ? 'Email' : 'Phone';
    print(key);
    queryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Trang chỉnh sửa thông tin")),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.purple],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Stack(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: Image(
                          image: AssetImage('assets/img/avt.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(50)),
                        ))
                  ],
                ),
                SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          label: Text("Tên đăng nhập"),
                          prefix: Icon(Icons.account_circle),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: email,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          label: Text("Email"),
                          prefix: Icon(Icons.email),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.purple,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        )),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          label: Text("Số điện thoại"),
                          prefix: Icon(Icons.call),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.purple,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                        )),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: birthday,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          label: Text("Ngày sinh"),
                          prefix: Icon(Icons.calendar_month),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.purple,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                        )),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Colors.white, style: BorderStyle.solid),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Text(
                            "Giới tính",
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'nam',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!.toString();
                                    });
                                  }),
                              Text(
                                "Nam",
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(width: 160),
                              Radio(
                                  value: 'nữ',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!.toString();
                                    });
                                  }),
                              Text("Nữ", style: TextStyle(fontSize: 17)),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async {
                          if (phone.text.isEmpty && email.text.isNotEmpty ||
                              phone.text.isNotEmpty && email.text.isEmpty ||
                              phone.text.isNotEmpty && email.text.isNotEmpty) {
                            Map<String, dynamic> dataToUpdate = {
                              'Birthday': birthday.text.isNotEmpty
                                  ? birthday.text
                                  : null,
                              'Name': name.text.isNotEmpty ? name.text : null,
                              'Email':
                                  email.text.isNotEmpty ? email.text : null,
                              'Phone':
                                  phone.text.isNotEmpty ? phone.text : null,
                              'Sex': groupValue
                            };
                            String? idDoc = await queryData();
                            if (idDoc != null) {
                              print(idDoc.toString());
                              CollectionReference collect = FirebaseFirestore
                                  .instance
                                  .collection('Account');
                              DocumentReference document =
                                  collect.doc(idDoc.toString());
                              document.update(dataToUpdate);
                            } else {
                              print(" KHONG THE TIM THAY TAI LIEU CAP NHAT");
                            }
                            setState(() {
                              queryData();
                            });
                          }
                        },
                        child: Text(
                          "Cập nhật",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ))
              ],
            )),
      ),
    );
  }
}

//email, sdt, tên người dùng, ngày sinh, giới tính, avatar
