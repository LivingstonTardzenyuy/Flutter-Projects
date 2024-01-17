import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../widgets/dropdown_button.dart';

class AddProduct extends StatelessWidget {
  // const AddProduct({super.key});
 Widget addTextField(String label, String hintText, {int? maxline}){
    return TextField(
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
              addTextField('Enter name', 'Enter your product name'),
              SizedBox(height: 12,),
              addTextField('Enter Description', 'Enter product Description', maxline: 5),
              SizedBox(height: 12,),
              addTextField('Image URL', 'Enter your image url'),
              SizedBox(height: 12,),
              addTextField('Product price', 'Enter your product price'),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: DropDownButton(items: ['Cate1', 'Cate2', 'Cate2'], selectedItemsText: 'Cate1', onSelected: (selectedValue) { print(selectedValue); },)),
                  Flexible(child: DropDownButton(items: ['Brand1', 'Brand2', 'Brand3'], selectedItemsText: 'Brand1', onSelected: (selectedValue) {print(selectedValue);  },)),
                ],
              ),
              SizedBox(height: 10,),
              Text('Offer products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              DropDownButton(items: ['true', 'false'], selectedItemsText: 'true', onSelected: (selectedValue) {print(selectedValue);  },),

              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,

                  ),
                    onPressed: () {},
                    child: Text('Add Product')),
              )
            ],
          ),
        ),
      )
    );
  }
}