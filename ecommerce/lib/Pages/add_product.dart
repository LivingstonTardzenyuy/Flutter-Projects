import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/dropdown_button.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // const AddProduct({super.key});
 Widget addTextField(String label, String hintText,{int? maxline, required TextEditingController controller}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(label),
          hintText: hintText
      ),
      maxLines: maxline,
    );
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Add Product'),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text('Add New Products', style: TextStyle(fontSize: 20,color: Colors.indigoAccent, fontWeight: FontWeight.bold), ),
                    SizedBox(height: 12,),
                    addTextField('Enter name', 'Enter your product name', controller: controller.productNameController),
                    SizedBox(height: 12,),
                    addTextField('Enter Description', 'Enter product Description',controller: controller.productDescriptionController, maxline: 5),
                    SizedBox(height: 12,),
                    addTextField('Image URL', 'Enter your image url', controller: controller.productImageController),
                    SizedBox(height: 12,),
                    addTextField('Product price', 'Enter your product price', controller: controller.productPriceController),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(child: DropDownButton(
                          items: ['Cate1', 'Cate2', 'Cate2'],
                          selectedItemsText: controller.category, onSelected: (selectedValue) { controller.category = selectedValue ?? 'general';
                            controller.update();
                            },)),

                        Flexible(child: DropDownButton(
                          items: ['Brand1', 'Brand2', 'Brand3'],
                          selectedItemsText: controller.brand, onSelected: (selectedValue) {controller.brand = selectedValue ?? 'un branded';
                            controller.update();
                            },)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('Offer products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    DropDownButton(items: ['true', 'false'],
                      selectedItemsText: controller.offer.toString(), onSelected: (selectedValue) {controller.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                      controller.update();
                      },),
                    SizedBox(height: 15,),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            foregroundColor: Colors.white,

                          ),
                          onPressed: () {
                            controller.addProducts();
                          },
                          child: Text('Add Product')),
                    )
                  ],
                ),
              ),
            )
        );
      },

    );
  }
}
