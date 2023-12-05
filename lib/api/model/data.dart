import 'dart:convert';
import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'rooms.dart';

class Data {
  static var mode_warning;
  static List<Room> lstRoom =
      List.filled(0, Room("", true, List.empty(), ""), growable: true);
  static DatabaseReference reference = FirebaseDatabase.instance.reference();

  static Future<void> loadData() async {
    try {
      DatabaseEvent snap = await reference.once();
      handleDataChange(snap.snapshot);
    } catch (error) {
      print('Error reading data: $error');
    }
  }

  static void handleDataChange(DataSnapshot snapshot) {
    try {
      String str = jsonEncode(snapshot.value);
      Map<String, dynamic> data = jsonDecode(str);
      mode_warning = data['mode_warning'];
      lstRoom.clear();
      for (var entry in data['room']) {
        if (entry != null) {
          lstRoom.add(Room.fromJson(entry));
        }
      }
    } catch (error) {
      print('Error handling data change: $error');
    }
  }

  static void test() async {
    DatabaseEvent data = await reference.child('room/0/follow').once();
    //print('follow');
    //print(data.snapshot.value);
    //  print('object');
  }

  static void listenToHomePageDataChanges(VoidCallback updateCallback) {
    reference.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        handleDataChange(event.snapshot);
        updateCallback();
      }
    }, onError: (Object error) {
      print('Error listening to data changes: $error');
    });
  }

  static Future<void> updateRoomValue(
      dynamic idx, String fieldName, dynamic newValue) async {
    try {
      await reference.child('room/$idx').update({fieldName:newValue});
      print('Data updated successfully.');
    } catch (error) {
      print('Error updating data: $error');
    }
  }

  static Future<void> updateDeviceValue(
      dynamic idxR,dynamic idxDv, String fieldName, dynamic newValue) async {
    try {
      await reference.child('room/$idxR/devices/$idxDv').update({fieldName:newValue});
      print('Data updated successfully.');
    } catch (error) {
      print('Error updating data: $error');
    }
  }
}
