import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

Future<DocumentReference> data(
    String Name, String unit, String Pass, bool Auth) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String key = unit.contains('@') ? 'Email' : 'Phone';
  return await firestore.collection('Account').add({
    'Name': Name,
    'Password': Pass,
    key: unit,
    'Auth': Auth,
  });
}
