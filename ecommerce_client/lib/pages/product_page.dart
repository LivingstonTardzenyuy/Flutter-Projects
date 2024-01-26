import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Footware Store',
          style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.logout))
        ],
      ),

      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index){
                return Text('Category');
          }),)
        ],
      ),
    );
  }
}
