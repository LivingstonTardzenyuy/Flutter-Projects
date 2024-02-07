import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final String offerTag;
  ProductCard({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.offerTag
})
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
              imageUrl,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 100,
            ),
            SizedBox(height: 10,),
            Text(name, style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),),
            SizedBox(height: 5,),
            Text('fcfa $price', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),),
            SizedBox(height: 4,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(offerTag),
            )
          ],
        ),
      ),
    );
  }
}
