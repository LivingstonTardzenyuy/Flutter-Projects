import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

}