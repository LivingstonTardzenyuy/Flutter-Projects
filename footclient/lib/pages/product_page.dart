import 'package:flutter/material.dart';

import '../widgets/dropdown_botton.dart';
import '../widgets/multi_select_dropdown.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Footwear Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
                  child: Chip(
                    label: Text('Category'),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: Card(
                  child: MultiSelectDropdown(
                    items: ['item 1', 'item 2', 'item 3'],
                    onSelectionChanged: (selectedItems) {
                      // Handle selected items here
                      print('Selected items: $selectedItems');
                    },
                  ),
                ),
              ),
              Flexible(
                child: DropDownButton(
                  items: ['Low to High', 'High to Low'],
                  selectedItemsText: 'Sort',
                  onSelected: (selected) {},
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8, // Adjust this aspect ratio as needed
                crossAxisSpacing: 8,
                mainAxisSpacing: 8, // Add mainAxisSpacing
              ),
              itemCount: 14, // Change itemCount to the number of grid items you want
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
