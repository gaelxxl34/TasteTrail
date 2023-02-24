import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentification_repository/authentification_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class UserDetailsController extends GetxController{
  static UserDetailsController get instance => Get.find();

  // get user firstname and pass below
  final _authRepo = Get.put(AuthentificationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final Phone = _authRepo.firebaseUser.value?.phoneNumber;
    if(Phone != null){
      return _userRepo.getUserDetails(Phone);
    } else {
      Get.snackbar("Error", "Something is wrong try again", colorText: Colors.red);
    }
  }

  Future<List<UserModel>> getAllUser() async{
    return _userRepo.allUser();
  }
}