import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:learning_getx/pages/homePage.dart';
import 'package:learning_getx/pages/pdf.dart';

import '../controllers/tap_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
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
                child: Center(child: Text('Total = ' + Get.find<TapController>().z.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),
              ),
              SizedBox(height: 20,),
              Obx(() =>
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF89dad0)
                    ),
                    child: Center(child: Text('Y value = ' + Get.find<TapController>().y.value.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),
                  ),),

              SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  Get.to(() => HomePage());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF89dad0)
                  ),
                  child: Center(child: Text("X value = " + Get.find<TapController>().x.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),
                ),
              ),

              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Get.find<TapController>().increaseY();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF89dad0)
                  ),
                  child: Center(child: Text('increase Y', style: TextStyle(fontSize: 20, color: Colors.white),),),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Get.find<TapController>().addXandY();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF89dad0)
                  ),
                  child: Center(child: Text('Total X + Y = ', style: TextStyle(fontSize: 20, color: Colors.white),),),
                ),
              ),


              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Get.to(() => PdfReader());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF89dad0)
                  ),
                  child: Center(child: Text('Launch PDF', style: TextStyle(fontSize: 20, color: Colors.white),),),
                ),
              ),


            ],
          ),
        )
    );
  }
}
