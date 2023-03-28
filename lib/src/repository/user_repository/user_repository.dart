import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../features/authentification/controllers/signup_controller.dart';
import '../../features/authentification/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final userr = FirebaseAuth.instance;


  createUser(UserModel user) async {
    CollectionReference<Map<String, dynamic>> users = _db.collection("Users");

    // Generate the UID automatically using the doc() method
    DocumentReference<Map<String, dynamic>> docRef = users.doc();
    user.uid = docRef.id;

    await docRef.set(user.toJson()).whenComplete(
          () => Get.snackbar(
          "Success",
          "your account has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green),
    )
        .catchError((error, stackTrace) {
      Get.snackbar(
          "Error",
          "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      //print(error.toString());
    });
  }

  Future<int> findUsers(String Phone) async{
   final snapshot = await _db.collection('Users').where("PhoneNo", isEqualTo: Phone).get();
    // final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
   return snapshot.docs.length;
}

  Future<UserModel?> getUserDetails(String phone) async {
    final snapshot = await _db.collection('Users').where("PhoneNo", isEqualTo: phone).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;

  }

  Future<List<UserModel>> allUser() async{
    final snapshot = await _db
        .collection('Users')
        .where("uid",
        isEqualTo: userr.currentUser!.uid).
        get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
}
}
