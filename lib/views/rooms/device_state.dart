import 'package:doan_monhoc/api/model/devices.dart';
import 'package:flutter/material.dart';

import '../../api/model/data.dart';

class DeviceState extends StatefulWidget {
  DeviceState({super.key, required this.dv, required this.idxR});
  int idxR;
  Device dv;
  @override
  State<DeviceState> createState() => _DeviceStateState();
}

class _DeviceStateState extends State<DeviceState> {
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
    //print(widget.dv.idx);
    //print(widget.dv.name);
    return Card(
      child:GestureDetector(
        onTap: () {
          
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text(widget.dv.name.contains("btn")?"Nút nhấn":(widget.dv.name.contains("led")?"Đèn led":"LCD")),
                content: Text(widget.dv.description),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text('Đóng')),
                ],
              );
              
            });
        },

        child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(widget.dv.name.contains("led")?(widget.dv.state
                    ? Icons.light_mode
                    : Icons.light_mode_outlined):(widget.dv.name.contains("btn")?Icons.swipe_outlined:Icons.devices_sharp)),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.dv.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),(
              widget.dv.name.contains("led")?
            Switch(
                value: widget.dv.idx==0?Data.mode_warning:widget.dv.state,
                onChanged: (bool? value) {
                  setState(() {
                    widget.dv.state = value!;
                    Data.updateDevicesStatus(
                        "state", widget.dv.state, widget.idxR, widget.dv.idx);
                  });
                }):Text("")),
          ],
        ),
      ),
        
      )
      
    );
  }
}
