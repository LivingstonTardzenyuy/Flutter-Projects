import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2020-04/shoee.jpg',
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 100,
            ),
            SizedBox(height: 10,),
            Text('Price: 900', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),),
            SizedBox(height: 5,),
            Text('Name: Baleri', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),),
            SizedBox(height: 4,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('200% off'),
            )
          ],
        ),
      ),
    );
  }
}
