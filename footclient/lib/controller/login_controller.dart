import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../models/user.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController enterNumberCtrl = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShow = false; // Initialize as false
  int? otpSend;
  int? otpEnter;


  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  void addUser() {
    try {

      if (otpSend == otpEnter){
        DocumentReference doc = userCollection.doc();
        User user = User(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.tryParse(enterNumberCtrl.text),
        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar('Success', 'User added Successfully', colorText: Colors.green);
        } else {
        Get.snackbar('Error', 'OTP is not correct', colorText: Colors.red);
      }
      } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }
  void sendOTP() {
    try {
        if (registerNameCtrl.text.isEmpty || enterNumberCtrl.text.isEmpty) {
          Get.snackbar('Error', 'Please fill the field', colorText: Colors.red);
          return;
        }

      final random = Random();
      int otp = 1000 + random.nextInt(9000); // four digits
      print(otp);
      // will send otp and check if it's send successfully or not.
      if (otp != null) {
        Get.snackbar('Success', 'OTP sent successfully', colorText: Colors.green);
        otpFieldShow = true; // Set otpFieldShow to true
        otpSend = otp;
        update(); // Trigger UI update
      } else {
        Get.snackbar('Error', 'OTP not sent!', colorText: Colors.red);
      }
    } catch(e){
      print(e);
    } finally{
      update();
    }
  }
  
  Future<void> loginWithPhone() async {
    try {
      String phoneNumber = enterNumberCtrl.text;
      if(phoneNumber.isNotEmpty){
        var querySnapshot = await userCollection.where('number', isEqualTo:  phoneNumber).limit(1).get();
        if (querySnapshot.docs.isNotEmpty){
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
        }
      }
    }
  }
}
