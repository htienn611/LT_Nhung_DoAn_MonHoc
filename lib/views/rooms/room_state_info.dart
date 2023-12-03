import 'package:flutter/material.dart';

import '../components/slider_light.dart';

///////////////////////
class CardRoomState extends StatefulWidget {
  const CardRoomState({super.key});

  @override
  State<CardRoomState> createState() => _CardItemState();
}

class _CardItemState extends State<CardRoomState> {
  bool switchValue = true;
  double sliderValue = 5.0;

  @override
  Widget build(BuildContext context) {
    void _showSliderDialog() async {
      double? newSliderValue = await showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          print(sliderValue);
          return SliderDialog(initialValue: sliderValue);
        },
      );

      if (newSliderValue != null) {
        setState(() {
          sliderValue = newSliderValue;
          //print(sliderValue);
        });
      }
    }

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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.living_outlined,
                            color: Colors.blue,
                            size: 45,
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5, left: 5),
                            child: const Text(
                              "Phòng khách",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.thermostat_rounded,
                            size: 30,
                            color: Colors.red,
                            //color: var <20?Colors.blue:(var<26?Colors.amber:Colors.red),
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
                    "4 thiết bị kết nối",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: sliderValue < 1
                                      ? Colors.grey
                                      : Colors.blue,
                                  width: 3.0),
                              right: BorderSide(
                                  color: sliderValue < 2
                                      ? Colors.grey
                                      : Colors.blue,
                                  width: 3.0),
                              bottom: BorderSide(
                                  color: sliderValue < 3
                                      ? Colors.grey
                                      : Colors.blue,
                                  width: 3.0),
                              left: BorderSide(
                                  color: sliderValue < 4
                                      ? Colors.grey
                                      : Colors.blue,
                                  width: 3.0),
                            ),
                          ),
                          child: IconButton(
                              onPressed: _showSliderDialog,
                              icon: Icon(Icons.light_mode)))
                    ],
                  )
                ],
              ))),
    );
  }
}
///////////////////////