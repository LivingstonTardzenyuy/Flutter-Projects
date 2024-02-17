import 'package:flutter/material.dart';
import 'package:footclient/pages/product_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/login_controller.dart';
import '../widgets/otp.dart';
import 'login_page.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(15) ,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.blueGrey[50]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Your Account',style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple
                ),),
                SizedBox(height: 30,),
                TextField(
                  controller: controller.registerNameCtrl,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    prefixIcon: Icon(Icons.phone_android),
                    hintText: 'Enter your Name'
                  ),

                ),
                SizedBox(height: 30,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.enterNumberCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      prefixIcon: Icon(Icons.phone_android),
                      hintText: 'Enter your Number'

                  ),
                ),

                SizedBox(height: 30,),
                OTP(
                  otpFieldControllerV2: controller.otpController,
                  isVisibleOtp: controller.otpFieldShow,
                  onComplete: (otp) {
                    controller.otpEnter = int.tryParse(otp ?? 'GOOD');
                },),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if(controller.otpFieldShow){
                          controller.addUser();
                          Get.to((LoginPage()));
                        } else {
                          controller.sendOTP();
                        }
                         // controller.sendOTP();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple
                      ),
                      child: Text(controller.otpFieldShow ? 'Register' : 'Send OTP')
                  ),
                ),
                SizedBox(height: 15,),
                TextButton(
                    onPressed: () {
                      Get.to(() => ProductPage());
                    },
                    child: Text('Login', style: TextStyle(fontSize: 18),))
              ],
            ),
          ),
        );
      }
    );
    }
}
