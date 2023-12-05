import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_monhoc/views/edit_personal_info_screen.dart';
import 'package:doan_monhoc/views/home_screen.dart';
import 'package:flutter/material.dart';

import 'components/drawer_menu.dart';
import 'components/title_info.dart';

class Info extends StatefulWidget {
  Info({super.key, required this.unit});
  String unit;
  @override
  State<Info> createState() => _InfoState();
}

var key;
TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController sex = TextEditingController();
TextEditingController birthday = TextEditingController();
TextEditingController emai = TextEditingController();

class _InfoState extends State<Info> {
  void queryData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Account').get();
    List<QueryDocumentSnapshot> lstDoc = querySnapshot.docs;
      for (var element in lstDoc) {
      if (element[key] == widget.unit) {
        name.text = element['Name'];
        phone.text = element['Phone'];
        sex.text = element['Sex'];
        birthday.text = element['Birthday'];
        emai.text = element['Email'];
        break;      
    }
    };
  }
  void initState() {
    super.initState();
    key = widget.unit.contains('@') ? 'Email' : 'Phone';
    setState(() {
       queryData();
    });
   
  }

  @override
  Widget build(BuildContext context) {
    //print('a');
    print(widget.unit);

    double avtW = ((MediaQuery.of(context).size.width - 20) * 1.2 / 3) > 160
        ? 200
        : (MediaQuery.of(context).size.width - 20) * 1.2 / 3;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(size: 25.0),
        backgroundColor: Colors.white,
        title: const Text(
          "TRANG CÁ NHÂN",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(this.context);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPersonalInfo(id: widget.unit)),
              );
            },
            icon: Icon(Icons.edit),
            tooltip: "Chỉnh sửa thông tin",
          )
        ],
      ),
      drawer: DrawerMenu(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: avtW,
                        height: avtW,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/img/logoSmartHome.png"),
                        ),
                      ),
                      Positioned(
                          top: avtW * 0.69,
                          left: avtW * 0.69,
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade400),
                              child: const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.photo_camera,
                                    color: Colors.black,
                                  ))))
                    ],
                  ),
                  InfoTitle(
                      icon: Icons.phone, title: "Họ tên", value: name.text,

                      ),
                  InfoTitle(
                      icon: Icons.phone, title: "Di Động", value: phone.text),
                  InfoTitle(
                      icon: Icons.account_circle,
                      title: "Giới Tính",
                      value: sex.text),
                  InfoTitle(
                      icon: Icons.cake_rounded,
                      title: "Sinh Nhật",
                      value: birthday.text),
                  InfoTitle(
                      icon: Icons.email_rounded,
                      title: "Email",
                      value: emai.text),
                    
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Đưa ra hành động khi nút được nhấn (ví dụ: mở màn hình đổi mật khẩu)
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text(
                        //         'Chức năng đổi mật khẩu sẽ được thực hiện ở đây.'),
                        //   ),
                        // );
                      },
                      child: Text(
                        'Đổi Mật Khẩu',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Độ bo tròn của viền
                          ),
                        ),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        elevation: MaterialStateProperty.all<double>(8.0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        // Bạn có thể thêm thuộc tính khác tại đây, ví dụ như padding, textStyle, ...
                      ),
                    ),
                    
                  )
                ],
              
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        height: 50,
        items: [
          IconButton(
            onPressed: () {
              //  Navigator.pop(this as BuildContext);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(unit: widget.unit)),
              );
            },
            icon: const Icon(Icons.home, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => Info(
              //             unit: "",
              //           )),
              // );
            },
            icon: const Icon(color: Colors.grey, Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
