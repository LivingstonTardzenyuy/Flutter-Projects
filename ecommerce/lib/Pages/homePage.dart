import 'package:ecommerce/Pages/add_product.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        if (ctrl != null) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Footware Admin'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Title'),
                    subtitle: Text('Price-200'),
                    trailing: IconButton(
                      onPressed: () {
                        // print('pressed to delete item');
                        ctrl.testMethod();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                Get.to(AddProduct());
              },
              child: Icon(Icons.add),
            ),
          );
        } else {
          // Handle the case when controller or its properties are null
          return CircularProgressIndicator();
        }
      },
    );
  }
}
