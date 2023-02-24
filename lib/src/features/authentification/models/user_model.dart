import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//final userr = FirebaseAuth.instance;


class UserModel {
  String uid;
  final String firstname;
  final String lastname;
  final String Phone;

  UserModel({
    this.uid = '',
    required this.firstname,
    required this.lastname,
    required this.Phone,
  });

  toJson() {
    return {
      "uid" : uid,
      "Firstname": firstname,
      "Lastname": lastname,
      "PhoneNo": Phone,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        uid: document.id,
        firstname: data['Firstname'],
        lastname: data['Lastname'],
        Phone: data['PhoneNo']
    );
  }
}
