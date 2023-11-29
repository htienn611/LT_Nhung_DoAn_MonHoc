
import 'package:flutter/material.dart';

class CardTT extends StatefulWidget {
  const CardTT({super.key});

  @override
  State<CardTT> createState() => _CardTTState();
}

class _CardTTState extends State<CardTT> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 330,
      child:const Card(
        color: Colors.white,
      ),
    );
  }
}
///////////////////////


class Info extends StatefulWidget {
  const Info({super.key});
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TRANG CÁ NHÂN"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 25, 10, 5),
                            child: const SizedBox(
                              width: 150,
                              height: 150,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/img/anh1.png"),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 135,
                              left: 115,
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
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: const Text(
                      "Mai Nguyễn Hoàng Lộc",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ThanhPhan(
                      icon: Icons.phone,
                      title1: "0342154512",
                      title2: "Di Động"),
                  ThanhPhan(
                      icon: Icons.account_circle,
                      title1: "Giới Tính",
                      title2: "Nam"),
                  ThanhPhan(
                      icon: Icons.cake_rounded,
                      title1: "Sinh Nhật",
                      title2: "04 tháng 11 2003")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.edit),
                  label: const Text(
                    "Chỉnh sửa trang cá nhân",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(const Size(260,40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade400)),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.more_horiz),
                  label: const Text(""),
                  style: ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(35),
                      fixedSize: MaterialStateProperty.all<Size>(const Size(100,40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade400)),
                ),
              )
            ],
          ),
          const NutChucNang(icon: Icons.lock, title: "Đổi Mật Khẩu")
        ],
      ),
    );
  }
}
///////////////////////


// 3 dòng ngan avatar
class ThanhPhan extends StatefulWidget {
  const ThanhPhan(
      {super.key,
      required this.icon,
      required this.title1,
      required this.title2});
  final IconData icon;
  final String title1;
  final String title2;
  @override
  State<ThanhPhan> createState() => _ThanhPhanState();
}

class _ThanhPhanState extends State<ThanhPhan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                size: 35,
              )
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.title1),
                ],
              ),
              Row(
                children: [Text(widget.title2)],
              )
            ],
          )
        ],
      ),
    );
  }
}
///////////////////////

// Các dòng ở dưới

class NutChucNang extends StatefulWidget {
  const NutChucNang({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  State<NutChucNang> createState() => _NutChucNangState();
}

class _NutChucNangState extends State<NutChucNang> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ElevatedButton(
            onPressed: null, 
            style: ElevatedButton.styleFrom(
                //fixedSize: const Size(60,10)
                //minimumSize: 
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.icon),
                const Text("Đổi Mật Khẩu"),
                const Icon(Icons.navigate_next)
              ],
            ))
        ],
      );
  }
}