import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class LoginController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;


  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController enterNumberCtrl = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userCollection = firestore.collection('users');
  }


  void addUser() {
    try {
      if(registerNameCtrl.text.isEmpty || enterNumberCtrl.text.isEmpty){
        Get.snackbar('Error', 'Please fill the field', colorText: Colors.red);
        return;  // must put return so it stop exectuing the method
      }
      DocumentReference doc = userCollection.doc();
      User user = User(
        id: doc.id,
        name: registerNameCtrl.text,
        number: int.tryParse(enterNumberCtrl.text),
      );
      final userJson = user.toJson();
      doc.set(userJson);
      Get.snackbar('Success', 'User added Successfully', colorText: Colors.green);

    } catch(e){
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);

    }
  }

  void sendOTP() {

  }
}