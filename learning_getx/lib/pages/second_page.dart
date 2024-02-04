import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:learning_getx/pages/third_page.dart';

import '../controllers/tap_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => ThirdPage());
                },
                child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF89dad0)
                      ),
                      child: Center(child: Text('Go to Third Page', style: TextStyle(fontSize: 20, color: Colors.white),),),
                ),
              ),

            ],
          ),
        )
    );
  }
}
