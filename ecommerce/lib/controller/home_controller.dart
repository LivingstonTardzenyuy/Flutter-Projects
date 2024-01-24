import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    productCollection = firestore.collection('Products');
    super.onInit();
  }

  addProducts() {
    try {
      DocumentReference doc = productCollection.doc();
      Products product = Products(
        id: doc.id,
        name: productNameController.text,
        category: 'Boots',
        description: productDescriptionController.text,
        price: double.tryParse(productPriceController.text),
        brand: 'adidas',
        image: productImageController.text,
        offer: true,
      );

      //converting product to Json
      final productJson = product.toJson();
      doc.set(productJson);       //setting our products to document
      Get.snackbar('Success', 'Product added successfully', colorText: Colors.green);

    } catch (e){
      Get.snackbar('Error', 'Error adding product', colorText: Colors.red,);
      print(e);
    }
  }

  testMethod() {
    print('test  value');
  }
}