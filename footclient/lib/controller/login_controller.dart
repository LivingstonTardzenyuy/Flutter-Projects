import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class LoginController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userCollection = firestore.collection('users');
  }


  void addUser() {
    try {
      DocumentReference doc = userCollection.doc();
      User user = User(
        id: doc.id,
        name: 'kongnyuy',
        number: 683487373,
      );
      final userJson = user.toJson();
      doc.set(userJson);
      Get.snackbar('Success', 'User added Successfully', colorText: Colors.green);

    } catch(e){
      Get.snackbar('Error', 'Error in adding', colorText: Colors.red);
      print(e);

    }
  }
}