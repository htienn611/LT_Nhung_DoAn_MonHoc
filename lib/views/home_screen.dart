import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_monhoc/views/personal_account_management_screen.dart';
import 'package:flutter/material.dart';
/////
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange.shade400,
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 40, 5),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                            backgroundImage: AssetImage("assets/img/anh1.png")),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome to Home",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          "Mai Nguyễn Hoàng Lộc",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(36, 10, 0, 0),
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.grey.shade200,
                      ),
                    )
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 25,
            ),
            // Thông tin thời tiết nhiệt độ
            const CardTT(),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CardItem(),
                SizedBox(
                  width: 10,
                ),
                CardItem(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CardItem(),
                SizedBox(
                  width: 10,
                ),
                CardItem(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CardItem(),
                SizedBox(
                  width: 10,
                ),
                CardItem(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CardItem(),
                SizedBox(
                  width: 10,
                ),
                CardItem(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepOrange.shade400,
          animationDuration: const Duration(milliseconds: 300),
          height: 50,
          items: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home, color: Colors.grey.shade700),),
            IconButton(
              onPressed: null,
              icon: Icon(color: Colors.grey.shade700, Icons.add),),
            IconButton(
              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => const Info()));},
              icon: Icon(color: Colors.grey.shade700, Icons.account_circle_outlined),)
          ],
        ));
  }
}
///////////////////////
class CardItem extends StatefulWidget {
  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Colors.white,
          child: Container(
            //alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                      child: Icon(
                        Icons.living_outlined,
                        color: Colors.deepOrange.shade400,
                        size: 50,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: const[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30,0,0,0),
                      child: Text(
                        "Living Room",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 25, 0),
                      child: Text("3 familly members have access",style: TextStyle(fontSize: 11,color: Colors.grey.shade500),softWrap: true,),
                    ),
                Row(
                  children: [
                    Padding(
                      padding:const EdgeInsets.fromLTRB(30,10, 25, 0),
                      child: Text("4 Devices",style: TextStyle(fontSize: 13.5,color: Colors.deepOrange.shade400,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 50, 0),
                      child: Switch(
                        value: switchValue,
                        onChanged: (value){
                          setState(() {
                            switchValue = value;
                          });
                        },
                        activeColor: Colors.deepOrangeAccent.shade400,
                        inactiveThumbColor: Colors.grey.shade400,
                      ),
                    ),
                  ],
                )
              ],
            )
          )),
    );
  }
}
///////////////////////
