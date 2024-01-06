import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  //Anonymouse Firebase Login
  Future<void> anonLogin() async {
    try{
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e){

    }
  }

  Future<void> anonSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential?> googleLogin() async{
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();   // brings a window displaying emails for users to login.

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final authCredentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(authCredentials);

    } on FirebaseAuthException catch(e){

    }
  }
}