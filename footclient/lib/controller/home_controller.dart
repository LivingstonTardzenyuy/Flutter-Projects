import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product/products.dart';
import '../models/product_category/product_cate.dart';

class HomeController extends GetxController {

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value){
    _isLoading = value;
    update();
  }


  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  List<Products> products = [];
  List<Products> productsShowinUI = [];         // this one is to filter the products and store them in this productShowinUI
  List<ProductCategory> productCategories = [];
  @override

  Future<void> onInit() async {
    productCollection = firestore.collection('Products');
    categoryCollection = firestore.collection('category');
    await fechCategory();
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
        productsShowinUI.assignAll(products);
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

  fechCategory() {
    try {
      categoryCollection.snapshots().listen((snapshot) {
        final List<ProductCategory> retrievedCategory = snapshot.docs.map((doc) =>
            ProductCategory.fromJson(doc.data() as Map<String, dynamic>)).toList();
        productCategories.clear();
        productCategories.assignAll(retrievedCategory);
        update();
      });
    } catch(e) {
      Get.snackbar('Eror', e.toString(), colorText: Colors.red);
      print(e);
    } finally{
      update();
    }
  }

  filterByCategory(String category) {
    productsShowinUI.clear();
    productsShowinUI = products.where((products) => products.category == category).toList();
    print(productsShowinUI.length);
    update();
  }

}