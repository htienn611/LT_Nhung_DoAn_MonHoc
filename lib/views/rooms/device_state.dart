import 'package:doan_monhoc/api/model/data.dart';
import 'package:doan_monhoc/api/model/devices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

int _indexRoom = 0;

class DeviceState extends StatefulWidget {
  DeviceState(
      {super.key,
      required this.dv,
      required this.indexRoom,
      required this.indexDv});
  Device dv;
  int indexRoom;
  int indexDv;
   DatabaseReference reference = FirebaseDatabase.instance.reference();

  @override
  State<DeviceState> createState() => _DeviceStateState();
}



class _DeviceStateState extends State<DeviceState> {
  bool status = false;
  

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
                !widget.dv.name.contains('btn')
                    ? Icon(
                        status ? Icons.light_mode : Icons.light_mode_outlined)
                    : Icon(Icons.radio_button_checked),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.dv.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            !widget.dv.name.contains('btn')
                ? Switch(
                    value: status,
                    onChanged: (bool? value) {
                      setState(() {
                        status = value!;
                      });
                   Data.updateDevicesStatus("state", status, widget.indexRoom, widget.indexDv);
                    })
                : Text(widget.dv.description),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {

    _indexRoom = widget.indexRoom;
    super.initState();
    widget.reference
        .child('room')
        .child(widget.indexRoom.toString())
        .child('devices')
        .child(widget.indexDv.toString())
        .child('state')
        .onValue
        .listen((event) {
      var snapshot = event.snapshot;
      print(snapshot.value);
      setState(() {
        print(widget.dv.name);

        status = snapshot.value == true;
      });
    });
  }
}
