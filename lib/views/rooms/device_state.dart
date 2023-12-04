import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DeviceState extends StatefulWidget {
  DeviceState({super.key});
  bool ledSw = false;
  var name = "Đèn";
  @override
  State<DeviceState> createState() => _DeviceStateState();
}

class _DeviceStateState extends State<DeviceState> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(widget.ledSw?Icons.light_mode:Icons.light_mode_outlined),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Switch(
                value: widget.ledSw,
                onChanged: (bool? value) {
                  setState(() {
                    widget.ledSw = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
