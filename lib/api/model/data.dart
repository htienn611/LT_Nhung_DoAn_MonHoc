import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'rooms.dart';

class Data {
  static var mode_warnig;
  static List<Room> lstRoom =
      List.filled(0, Room("", true, List.empty()), growable: true);

  static Future<void> loadData() async {
    DatabaseReference reference = FirebaseDatabase.instance.reference();
    try {
      DatabaseEvent snap = await reference.once();
      String str = jsonEncode(snap.snapshot.value);
      Map<String, dynamic> data = jsonDecode(str);
      mode_warnig = data['mode_warning'];
      // print(data['room'].runtimeType);
      lstRoom.clear();
      for (var entry in data['room']) {
        if (entry != null) {
          lstRoom.add(Room.fromJson(entry));
        }
      }
      print(lstRoom.length);
      lstRoom.forEach((element) {
        print(element.name);
      });
      //print(lstRoom);
    } catch (error) {
      print('Error reading data: $error');
    }
  }
}
