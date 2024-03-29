import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:ecommerce/model/product/product.g.dart';

class HomeController extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  String category = 'general';
  String brand = 'Un branded';
  bool offer = false;

  bool _isloading = false;
  bool get isloading => _isloading;

  void setLoading(bool value){
    _isloading = value;
    update();
  }
  
  List<Products> product = [];

  @override
  Future<void> onInit() async{
    // TODO: implement onInit
    productCollection = firestore.collection('Products');
    await fetchProducts();
    super.onInit();
  }

  addProducts() {
    try {
      DocumentReference doc = productCollection.doc();
      Products product = Products(
        id: doc.id,
        name: productNameController.text,
        category: category,
        description: productDescriptionController.text,
        price: double.tryParse(productPriceController.text),
        brand: brand,
        image: productImageController.text,
        offer: offer,
      );
      //converting product to Json
      final productJson = product.toJson();
      doc.set(productJson); //setting our products to document
      Get.snackbar(
          'Success', 'Product added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', 'Error adding product', colorText: Colors.red,);
      print(e);
    }
  }

  testMethod() {
    print('test  value');
  }

  setValuesDefault() {
    productNameController.clear();
    productDescriptionController.clear();
    productPriceController.clear();
    productImageController.clear();

    category = 'general';
    brand = 'un branded';
    offer = false;

    update();
  }

  fetchProducts() async {
    try {
      setLoading(true);
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Products> retrieveProducts = productSnapshot.docs.map((doc) =>
          Products.fromJson(doc.data() as Map<String, dynamic>)).toList();

      // Print products as JSON to the console
      // print(productsToJson(retrieveProducts));
      product.clear();
      product.assignAll(retrieveProducts);

      Get.snackbar('Success', 'Products fetched successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      // update();
      setLoading(false);
    }

  }


  deleteProducts(String id) async{
    try{
      await productCollection.doc(id).delete();
      fetchProducts();
    } catch(e){
      print(e);
    }

  }
}
// 686689418