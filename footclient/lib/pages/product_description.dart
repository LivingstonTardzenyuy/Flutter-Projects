import 'package:flutter/material.dart';
class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2020-04/shoee.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                'Puma Footware',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              SizedBox(height: 13,),
              Text('Product Description', style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              Text('300 fcfa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.yellow),),

              TextField(
                textAlign: TextAlign.center,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: 'dfkdfjdklfjdkl kj klj ',
                  
                ),
              ),
              
              
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 70,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Buy Now', style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              )
            ],
          ),
        )
    );
  }
}
