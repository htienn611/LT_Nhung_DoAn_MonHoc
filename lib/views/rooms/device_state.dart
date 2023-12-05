import 'package:doan_monhoc/api/model/data.dart';
import 'package:doan_monhoc/api/model/devices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import '../../api/model/data.dart';

class DeviceState extends StatefulWidget {
  DeviceState({super.key, required this.dv, required this.idxR});
  int idxR;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Data.listenToHomePageDataChanges(() {
      setState(() {});
    });
  }

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

            Switch(
                value: widget.dv.state,
                onChanged: (bool? value) {
                  setState(() {
                    widget.dv.state = value!;
                    Data.updateDeviceValue(
                        widget.idxR, widget.dv.idx, "state", widget.dv.state);
                  });
                }),
          ],
        ),
      ),
    );
  }

//   @override
//   void initState() {

//     _indexRoom = widget.indexRoom;
//     super.initState();
//     widget.reference
//         .child('room')
//         .child(widget.indexRoom.toString())
//         .child('devices')
//         .child(widget.indexDv.toString())
//         .child('state')
//         .onValue
//         .listen((event) {
//       var snapshot = event.snapshot;
//       print(snapshot.value);
//       setState(() {
//         print(widget.dv.name);

//         status = snapshot.value == true;
//       });
//     });
  }
}
