import 'package:doan_monhoc/api/model/devices.dart';
import 'package:flutter/material.dart';
import '../../api/model/rooms.dart';
import '../components/slider_light.dart';

class CardRoomState extends StatefulWidget {
  CardRoomState({super.key, required this.room});
  Room room;
  late Device led;
  bool isBedR = false;
  @override
  State<CardRoomState> createState() => _CardItemState();
}

class _CardItemState extends State<CardRoomState> {
  double sliderValue = 4.0;
  void _showSliderDialog() async {
    double? newSliderValue = await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        //  print(sliderValue);
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

  void CheckIsBedR() {
    setState(() {
      widget.isBedR = widget.room.name.contains('ngủ') ? true : false;
      widget.led = widget.room.lstDevice
          .singleWhere((element) => element.name.contains("led_light"));
    });
  }

  void updateLedState() {
    setState(() {
      widget.led.state = !widget.led.state;
    });
    //  widget.led = Device("", true, "");
    // widget.led = widget.room.lstDevice
    //     .singleWhere((element) => element.name.contains("bed"));
    print(widget.led.state);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CheckIsBedR();
    //print(widget.isBedR);
    //  updateLedState();
    print('a');
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
                            child: Text(
                              widget.room.name,
                              style: const TextStyle(
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
                  Row(
                    children: [
                      Text(widget.room.lstDevice.length.toString()),
                      Text(
                        " thiết bị kết nối",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Theo dõi",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                        value: widget.room.follow,
                        onChanged: (value) {
                          setState(() {
                            widget.room.follow = value;
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
                              onPressed: widget.isBedR
                                  ? _showSliderDialog
                                  : updateLedState,
                              icon: Icon((widget.led.state && !widget.isBedR) ||
                                      (sliderValue > 0&&widget.isBedR)
                                  ? Icons.light_mode
                                  : Icons.light_mode_outlined)))
                    ],
                  )
                ],
              ))),
    );
  }
}
///////////////////////