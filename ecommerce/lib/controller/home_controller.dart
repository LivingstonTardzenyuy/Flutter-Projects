import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }

  testMethod() {
    print('test  value');
  }
}