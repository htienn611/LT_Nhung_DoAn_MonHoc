import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_monhoc/api/createDataFireBase.dart';
import 'package:flutter/material.dart';

class account_CreationScreen extends StatefulWidget {
  const account_CreationScreen({super.key});

  @override
  State<account_CreationScreen> createState() => _account_CreationScreenState();
}

class _account_CreationScreenState extends State<account_CreationScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _unit = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _repass = TextEditingController();
  bool _auth = false;
  String tb = "";
  CollectionReference _user = FirebaseFirestore.instance.collection('Account');
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 100, 10, 5),
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
              Padding(padding: EdgeInsets.all(10)),
              Text("ĐĂNG KÝ TÀI KHOẢN",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tên người dùng',
                  hintStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _name,
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email hoặc Số điện thoại',
                  hintStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _unit,
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  hintStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _pass,
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập lại mật khẩu',
                  hintStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _repass,
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _auth,
                    onChanged: (bool? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                  Text(
                    "Quản lý tài khoản",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    //kt
                    if (_name.text.isEmpty ||
                        _unit.text.isEmpty ||
                        _pass.text.isEmpty ||
                        _repass.text.isEmpty) {
                      return;
                    }

                    if (_pass.text == _repass.text) {
                      checkData(_unit.text).then((value) => value == false
                          ? (data(_name.text, _unit.text, _pass.text, _auth)
                              .then((value) => value.id == null
                                  ? tb = "Đăng kí tài khoản không thành công"
                                  : tb = "Đăng kí tài khoản thành công"))
                          : tb = "tài khoản đã tồn tại");
                    } else {
                      tb = "Mật khẩu xác nhận không trùng khớp";
                    }
                    setState(() {});
                  },
                  child: Text("Đăng kí")),
              Text(
                tb,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<bool> checkData(String unit) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Account').get();
    List<QueryDocumentSnapshot> lstDoc = querySnapshot.docs;
    bool isDataExist = false;
    for (var element in lstDoc) {
      String key = unit.contains('@') ? 'Email' : 'Phone';
      if (element[key] == unit) {
        isDataExist = true;
        break;
      }
    }
    return isDataExist;
  }
}
