import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text('Add Products', style: TextStyle(fontSize: 20,color: Colors.indigoAccent), ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
