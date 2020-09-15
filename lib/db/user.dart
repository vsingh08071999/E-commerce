import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  Firestore _firestore = Firestore.instance;
  String ref = "users";
  createUser(Map data) {
    _firestore.collection(ref).document(data["userId"]).setData(data);
  }
}
