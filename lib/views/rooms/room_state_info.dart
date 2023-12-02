import 'package:flutter/material.dart';

///////////////////////
class CardRoomState extends StatefulWidget {
  const CardRoomState({super.key});

  @override
  State<CardRoomState> createState() => _CardItemState();
}

class _CardItemState extends State<CardRoomState> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 40) > 400
          ? 400
          : (MediaQuery.of(context).size.width - 40),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.blue),
          ),
          child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.living_outlined,
                        color: Colors.blue,
                        size: 50,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.thermostat_rounded,
                            size: 30,
                            color: Colors.red,
                          ),
                          Text(
                            '24 °C',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Living Room",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "4 Devices",
                    style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Theo dõi",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.grey.shade400,
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
///////////////////////