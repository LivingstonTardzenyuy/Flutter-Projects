import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learning_getx/controllers/tap_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {

    TapController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('First Class'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF89dad0)
              ),
              child: Center(child: Text(controller.x.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),
            ),

            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text(controller.x.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),
              ),
            )
          ],
        ),
      )
    );
  }
}
