import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentification/screens/dashboard_screen/dashboard.dart';
import '../../features/authentification/screens/dashboard_screen/navbar/narbar.dart';
import '../../features/authentification/screens/login/login_screen.dart';
import '../../features/authentification/screens/signup/signup_screnn.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthentificationRepository extends GetxController{
  static AuthentificationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  final _db = FirebaseFirestore.instance;


  @override
  void onReady() {
    Future.delayed(Duration(seconds: 5));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setIniationScreen);
  }

  _setIniationScreen(User? user) {
    user == null ? Get.offAll(() => const LoginScreen()) : Get
        .offAll(() => const Home());
  }

  Future<void> phoneAuthentification(String PhoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: PhoneNo,
        verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken){
        this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
        this.verificationId.value = verificationId;
        },
        verificationFailed: (e){
        if(e.code == "invalid-phone-number"){
          Get.snackbar('Error', 'The provide number is not valid');
        }
        else {
          Get.snackbar('Error', 'Something went wrong. try later', colorText: Colors.red);
        }
        },
    );
  }

  Future<int> findUserNo(String Phone) async{
    final snapshot = await _db.collection('Users').where("PhoneNo", isEqualTo: Phone).get();
    return snapshot.docs.length;
  }

  Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth.
    signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }






// log out function
    Future<void> logout() async => await _auth.signOut();


}