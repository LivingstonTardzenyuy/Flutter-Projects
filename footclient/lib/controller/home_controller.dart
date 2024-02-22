import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product/products.dart';

class HomeController extends GetxController {

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value){
    _isLoading = value;
    update();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  List<Products> products = [];
  @override

  Future<void> onInit() async {
    productCollection = firestore.collection('Products');
    await fetchProducts();
    super.onInit();
  }

    // fetchProducts() async {
    //   try {
    //     setLoading(true);
    //     QuerySnapshot producutSnapshot = await productCollection.get();
    //     final List<Products> retrievedProducts = producutSnapshot.docs.map((doc) =>
    //       Products.fromJson(doc.data() as Map<String, dynamic>)).toList();
    //     products.clear();
    //     products.assignAll(retrievedProducts);
    //     Get.snackbar('Success', 'Product fetch successfully', colorText: Colors.green);
    //     print("the length is ${products.length}");
    //   } catch(e){
    //     Get.snackbar('Error', e.toString(), colorText: Colors.red);
    //     print(e);
    //   } finally {
    //     // update();
    //     setLoading(false);
    //   }
    // }

  fetchProducts() {
    try {
      setLoading(true);
      productCollection.snapshots().listen((snapshot) {
        final List<Products> retrievedProducts = snapshot.docs.map((doc) =>
            Products.fromJson(doc.data() as Map<String, dynamic>)).toList();
        products.clear();
        products.assignAll(retrievedProducts);
        Get.snackbar('Success', 'Product fetch successfully', colorText: Colors.green);
        print("the length is ${products.length}");
        update();
      });
    } catch(e){
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      setLoading(false);
    }
  }

}