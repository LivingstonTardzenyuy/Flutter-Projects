import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userCollection = firestore.collection('users');
  }
}