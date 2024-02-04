import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/tap_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<TapController>(
                builder: (TapController controller) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF89dad0)
                    ),
                    child: Center(child: Text(controller.x.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),),
                  );
                },
              ),

              SizedBox(height: 40,),
              GetBuilder<TapController>(
                builder: (TapController controller) {
                  return GestureDetector(
                    onTap: () {
                      controller.decreaseX();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF89dad0)
                      ),
                      child: Center(child: Text('Decrease x', style: TextStyle(fontSize: 20, color: Colors.white),),),
                    ),
                  );
                },

              )
            ],
          ),
        )
    );
  }
}
