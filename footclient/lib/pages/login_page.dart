import 'package:flutter/material.dart';
import 'package:footclient/controller/login_controller.dart';
import 'package:footclient/pages/product_page.dart';
import 'package:footclient/pages/register_page.dart';
import 'package:get/get.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(15),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.blueGrey[50]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome Back!',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple
                  ),),

                SizedBox(height: 20,),
                TextField(
                  controller: controller.enterNumberCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Mobile Number',
                      hintText: 'Enter your mobile number'
                  ),
                ),

                SizedBox(height: 35,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.loginWithPhone();
                        // Get.to((ProductPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text('Login')),
                ),

                SizedBox(height: 30,),
                TextButton(
                    onPressed: () {
                      Get.to((RegisterPage()));
                    },
                    child: Text('Register new account'))
              ],
            ),
          ),
        );
      },

    );
  }
}
