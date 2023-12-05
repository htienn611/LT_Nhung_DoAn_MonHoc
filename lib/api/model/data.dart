import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'rooms.dart';

class Data {
  static var mode_warnig;
  static List<Room> lstRoom =
      List.filled(0, Room("", true, List.empty()), growable: true);
  static  DatabaseReference reference = FirebaseDatabase.instance.reference();
  static Future<void> loadData() async {
    try {
      DatabaseEvent snap = await reference.once();
      String str = jsonEncode(snap.snapshot.value);
      Map<String, dynamic> data = jsonDecode(str);
      mode_warnig = data['mode_warning'];
      lstRoom.clear();
      for (var entry in data['room']) {
        if (entry != null) {
          lstRoom.add(Room.fromJson(entry));
        }
      }
  
    } catch (error) {
      print('Error reading data: $error');
    }
  }

  static Future<void> updateDevicesStatus(String key, bool status, dynamic idxR,dynamic idxDv) async {
    try {
      await reference
          .child('room')
          .child(idxR.toString())
          .child('devices')
          .child(idxDv.toString())
          .update({key: status});
      print("Firebase update successful");
    } catch (error) {
      print("Error updating Firebase: $error");
    }
  }
}
