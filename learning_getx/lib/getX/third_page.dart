import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_getx/controller/tap_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: GetBuilder<TapController>(
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              // print('you press me');
              controller.decreaseX();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF89dad0),
                    ),
                    child: Center(child: Text("X value " + controller.x.toString(), style: TextStyle(color: Colors.white, fontSize: 25),)),

                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
