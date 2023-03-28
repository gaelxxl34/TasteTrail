import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/login/login_screen.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/signup/signup_screnn.dart';

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
  final AuthRepo = Get.put(AuthentificationRepository());


//-- this is a method for login screen
  Future<void> phoneAuthentification(String phoneNumber) async{
    final UserLogin = await AuthRepo.findUserNo(phoneNumber);
    print('hello '+phoneNumber);
    if(UserLogin > 0){
      AuthentificationRepository.instance.phoneAuthentification(phoneNumber);
      Get.to(() => OTPscreen(PhoneNum: phoneN.text,));
    }else {
      Get.snackbar("Please Signup", "Unknown Phone number", colorText: Colors.red);
      Get.to(() => SignUpScreen());
    }

  }

  // -- the function below help to get the user data for sign up screen
  Future<void> createUser(UserModel user) async {
    //check if phone number is taken
    final usersFound = await UserRepo.findUsers(user.Phone);
    print('hello '+user.Phone);
    if(usersFound > 0) {
      Get.snackbar("Please login", "Phone number already exist", colorText: Colors.red);
      Get.to(() => LoginScreen());
    }else {
      print('hello new userfound'+user.Phone);
      phoneAuthentificationSignUp(user.Phone);
      Get.to(() => OTPscreen2(PhoneNum: phoneN.text,));
      await UserRepo.createUser(user);
    }
  }
  void phoneAuthentificationSignUp(String PhoneNo) {
    AuthentificationRepository.instance.phoneAuthentification(PhoneNo);
  }

}




