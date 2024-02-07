import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Image.network(
            'https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2020-04/shoee.jpg',
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: 120,
          ),
          SizedBox(height: 10,),
          Text('Price', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),),
          SizedBox(height: 10,),
          Text('Name', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),),
        ],
      ),
    );
  }
}
