import 'package:flutter/material.dart';
import 'package:footclient/controller/home_controller.dart';
import 'package:footclient/pages/login_page.dart';
import 'package:footclient/pages/product_description.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/dropdown_botton.dart';
import '../widgets/multi_select_dropdown.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller){
        if(controller.isLoading) {
          return RefreshIndicator(
            onRefresh: () async{
              controller.fechCategory();
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text("Browse Products"),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Footwear Store',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {
                  GetStorage box = GetStorage();  // log out the user;
                  box.erase();
                  Get.offAll((LoginPage()));  // offall allow use to log out a user an can't return to this page again.
                },
                    icon: Icon(Icons.logout)),
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: controller.productCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print('cat');
                          controller.filterByCategory(controller.productCategories[index].name ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
                          child: Chip(
                            label: Text(controller.productCategories[index].name ?? 'Error'),
                          ),
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
                    itemCount: controller.productsShowinUI.length, // Change itemCount to the number of grid items you want
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: controller.productsShowinUI[index].name ?? 'No name',
                        imageUrl: controller.productsShowinUI[index].image ?? 'Image Url',
                        price: controller.productsShowinUI[index].price ?? 00,
                        offerTag: '240',
                        onTap: () {
                          Get.to(() => ProductDescription());
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDescription()));
                        },
                      );
                    },
                  ),
                ),
                // ),
              ],
            ),
          );
        }

      },

    );
  }
}
