


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthServices {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  // //-------------------------------------------------------------------------//
  // //Firebase service to sign in with email and password
  // //with no error handling
  // Future<bool> signIn(String email, String password) async
  // {
  //   try {
  //     UserCredential userCredential = await _firebaseAuth
  //         .signInWithEmailAndPassword(
  //         email: email, password: password);
  //     return userCredential.user?.uid != null;
  //   }
  //   catch (error) {
  //     debugPrint("Error signing in: $error");
  //     return false;
  //   }
  // }
  // //-------------------------------------------------------------------------//





  //-------------------------------------------------------------------------//
  //Firebase service to sign in with email and password
  // //with error handling
  Future<bool> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user?.uid != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      } else if (e.code == 'user-disabled') {
        debugPrint('The user corresponding to the email has been disabled.');
      } else if (e.code == 'invalid-email') {
        debugPrint('The email address is not valid.');
      } else {
        debugPrint('An undefined Error happened.');
      }
      return false;
    } catch (e) {
      // If the exception is not a FirebaseAuthException, it will be caught here
      debugPrint('Error: $e');
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

      return userCredential.user?.uid != null;
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
  Future<bool> signInAnonymously() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      return userCredential.user?.uid != null;

    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'operation-not-allowed') {
          debugPrint("Error: Anonymous accounts are not enabled.");
        } else {
          debugPrint("Error signing in anonymously: ${error.code}");
        }
      } else {
        // Handling other exceptions that are not FirebaseAuthException
        debugPrint("Error signing in anonymously: $error");
      }
      return false; // Return false to indicate sign in failure
    }
  }



//-------------------------------------------------------------------------//







//-------------------------------------------------------------------------//
//Firebase service to verify phone number


//-------------------------------------------------------------------------//





//-------------------------------------------------------------------------//
//Firebase service to reset password


//-------------------------------------------------------------------------//


}