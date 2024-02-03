import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/controller/tap_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    TapController controller = Get.put(TapController());
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TapController>(
              builder: (tapController) {
                return GestureDetector(
                  onTap: () {
                    controller.increaseX();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF89dad0),
                    ),
                    child: Center(child: Text(tapController.x.toString(), style: TextStyle(color: Colors.white, fontSize: 25),)),
                  ),
                );
              },

            ),
            SizedBox(height: 25,),
            GetBuilder<TapController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    print('you tap me');
                    controller.decrease();
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF89dad0),
                      ),
                      child: Center(child: Text(controller.x.toString(), style: TextStyle(color: Colors.white, fontSize: 25),)),
                ),
                );
              },

            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: () {
                print('you tap me');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF89dad0),
                ),
                child: Center(child: Text("tap", style: TextStyle(color: Colors.white, fontSize: 25),)),
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: () {
                print('you tap me');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF89dad0),
                ),
                child: Center(child: Text("tap", style: TextStyle(color: Colors.white, fontSize: 25),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

