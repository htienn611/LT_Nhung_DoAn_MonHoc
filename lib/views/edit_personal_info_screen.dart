import 'package:flutter/material.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({super.key});

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  int groupValue = 1; //nam

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
                        keyboardType: TextInputType.emailAddress,
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
                        keyboardType: TextInputType.datetime,
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
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!;
                                    });
                                  }),
                              Text(
                                "Nam",
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(width: 160),
                              Radio(
                                  value: 0,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value!;
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
                        onPressed: () {},
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
