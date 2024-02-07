import 'package:flutter/material.dart';

import '../widgets/dropdown_botton.dart';
import '../widgets/multi_select_dropdown.dart';

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
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                return Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
                    child: Chip(label: Text('Category'),));
          }),),

          Row(
            children: [
              Flexible(child: Card(child: MultiSelectDropdown())),
              Flexible(
                child: DropDownButton(items: ['Low to High', 'High to Low'],
                  selectedItemsText: 'Sort',
                  onSelected: (selected) {  },),
              ),
            ],
          )
        ],
      ),
    );
  }
}
