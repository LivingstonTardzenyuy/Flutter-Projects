import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  @override
  void onInit() {

    // TODO: implement onInit
    productCollection = firestore.collection('Products');
    super.onInit();
  }

  addProducts() {
    DocumentReference doc = productCollection.doc(
      {
        'name': ''
      }
    );
  }

  testMethod() {
    print('test  value');
  }
}