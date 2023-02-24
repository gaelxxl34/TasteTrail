import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/login/login_screen.dart';

import '../../../repository/authentification_repository/authentification_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';
import '../screens/dashboard_screen/dashboard.dart';
import '../screens/forget_password/forget_password_otp/otp_screen.dart';


class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();


  // textfield to get the data from the sign up textfield
  final phoneN = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();

  final UserRepo = Get.put(UserRepository());

  // call this function from sign up screen and see the magic
  void phoneAuthentification(String phoneNumber) {
    AuthentificationRepository.instance.phoneAuthentification(phoneNumber);
    Get.to(() => OTPscreen());
  }

  // -- the function below help to get the user data
  Future<void> createUser(UserModel user) async {
    //check if phone number is taken
    final usersFound = await UserRepo.findUsers(user.Phone);
    print('hello '+user.Phone);
    if(usersFound > 0) {
      Get.snackbar("Please login", "Phone number already exist", colorText: Colors.red);
      Get.to(() => LoginScreen());
    }else {
      phoneAuthentification(user.Phone);
      Get.to(() => OTPscreen());
      await UserRepo.createUser(user);
    }
  }

}

 

