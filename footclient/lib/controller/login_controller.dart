import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../models/user.dart';

class LoginController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;


  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController enterNumberCtrl = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShow = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userCollection = firestore.collection('users');
    sendOTP();
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
    final random = Random();
    int otp = 1000 + random.nextInt(9000);   // four digits
    print(otp);

    // will send otp and check if it's send successfully or not.
    if (otp != null) {
      otpFieldShow = true;
      Get.snackbar('Success', 'OTP sent succesffully', colorText: Colors.green);
      update();
    } else {
      Get.snackbar('Error', 'OTP not sent!', colorText: Colors.red);
    }
  }
}