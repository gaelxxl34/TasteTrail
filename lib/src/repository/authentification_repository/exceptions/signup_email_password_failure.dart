
import 'package:get/get.dart';

class SignUpWithEmailAndPasswordFailure {
  final String message;

  SignUpWithEmailAndPasswordFailure([this.message = "Unknown error occurred"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak password':
        return SignUpWithEmailAndPasswordFailure('Please enter a strong password');
      case 'invalid password':
        return SignUpWithEmailAndPasswordFailure('Email is not valid or Badly formatted');
      case 'Email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('An account already exist for that email');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('operation is not allowed. Please contact support.');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure('This user has been disabled please contact support for help');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}