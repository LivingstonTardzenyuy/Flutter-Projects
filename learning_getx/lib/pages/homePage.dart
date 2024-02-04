import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:learning_getx/controllers/tap_controller.dart';
import 'package:learning_getx/pages/first_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.put(TapController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GetBuilder<TapController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    controller.increaseX();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF89dad0)
                    ),
                    child: Center(child: Text(controller.x.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),

                  ),
                );
              },

            ),
            SizedBox(height: 20,),
            GetBuilder<TapController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    controller.increaseX();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF89dad0)
                    ),
                    child: Center(child: Text('tap', style: TextStyle(fontSize: 20, color: Colors.white),),),
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Get.to(() => FirstPage());
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text('Go to First Page', style: TextStyle(fontSize: 20, color: Colors.white),),),

              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                print('click me');
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text('tap', style: TextStyle(fontSize: 20, color: Colors.white),),),

              ),
            ),

          ],
            )
        ),
      );
  }
}
