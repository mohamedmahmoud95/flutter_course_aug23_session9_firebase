


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthServices {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  //-------------------------------------------------------------------------//
  //Firebase service to sign in with email and password
  Future<bool> signIn(String email, String password) async
  {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.credential != null;
    }
    catch (error) {
      debugPrint("Error signing in: $error");
      return false;
    }
  }
  //-------------------------------------------------------------------------//






  //-------------------------------------------------------------------------//
  //Firebase service to sign up with email and password
  Future<bool> signUp(String email, String password) async
  {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.credential != null;
    }
    catch(error)
    {
      debugPrint("Error Signing up: $error");
      return false;
    }
  }
  //-------------------------------------------------------------------------//






  //-------------------------------------------------------------------------//
  //Firebase service to logout
  Future<void> logOut() async {
    try {
      _firebaseAuth.signOut();
    }
    catch(error){
      debugPrint("Error logging out: $error");
    }
  }
  //-------------------------------------------------------------------------//




//-------------------------------------------------------------------------//
//Firebase service to sign in with email link

//-------------------------------------------------------------------------//







//-------------------------------------------------------------------------//
//Firebase service to sign in anonymously


//-------------------------------------------------------------------------//







//-------------------------------------------------------------------------//
//Firebase service to verify phone number


//-------------------------------------------------------------------------//





//-------------------------------------------------------------------------//
//Firebase service to reset password


//-------------------------------------------------------------------------//


}