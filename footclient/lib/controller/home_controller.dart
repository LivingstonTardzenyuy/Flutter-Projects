import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
    fetchProducts() {
      try {
        QuerySnapshot producutSnapshot = await productCollection.get();
        final list<Product> retrievedProducts = fetchProducts().docs.map((doc) =>
          Product.fromJson(doc.data() as Map<String, dynamic>).toList()
        );
        products.clear();
        products.assignAll(retrievedProducts);
        Get.snackbar('Success', 'Product fetch successfully', colorText: Colors.green);
      } catch(e){
        Get.snackbar('Error', e.toString(), colorText: Colors.red);
        print(e);
      } finally {
        update();
      }
    }
}