import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product/products.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  List<Products> products = [];
  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();

  }

    fetchProducts() async {
      try {
        QuerySnapshot producutSnapshot = await productCollection.get();
        final List<Products> retrievedProducts = producutSnapshot.docs.map((doc) =>
          Products.fromJson(doc.data() as Map<String, dynamic>)).toList();
        products.clear();
        products.assignAll(retrievedProducts);
        Get.snackbar('Success', 'Product fetch successfully', colorText: Colors.green);
        print(products.length);
      } catch(e){
        Get.snackbar('Error', e.toString(), colorText: Colors.red);
        print(e);
      } finally {
        update();
      }
    }
}