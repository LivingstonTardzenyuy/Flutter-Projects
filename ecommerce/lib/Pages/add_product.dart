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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropDownButton(),
                  DropDownButton(),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
