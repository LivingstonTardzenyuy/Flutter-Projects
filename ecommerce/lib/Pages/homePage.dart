import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/home_controller.dart';
import 'add_product.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        if (ctrl.isloading) {
          // Show a CircularProgressIndicator while data is being fetched
          return Scaffold(
            appBar: AppBar(
              title: Text('Footware Admin'),
              centerTitle: true,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Data has been fetched, display the list
          return Scaffold(
            appBar: AppBar(
              title: Text('Footware Admin'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: ctrl.product?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ctrl.product?[index]?.name ?? '', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    subtitle: Text((ctrl.product?[index]?.price ?? 0).toString()),
                    trailing: IconButton(
                      onPressed: () {
                        ctrl.testMethod();
                      },
                      icon: IconButton(
                        onPressed: () {
                          ctrl.deleteProducts(ctrl.product[index].id ?? '');
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {
                Get.to(AddProduct());
              },
              child: Icon(Icons.add),
            ),
          );
        }
      },
    );
  }
}
