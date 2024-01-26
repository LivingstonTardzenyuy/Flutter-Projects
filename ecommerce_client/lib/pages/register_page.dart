import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text('Create Your Account',style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple
            ),),
            SizedBox(height: 30,),
            TextField(
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
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'Enter your Number'

              ),
            ),

            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple
                  ),
                  child: Text('Send OTP')),
            ),

            TextButton(
                onPressed: () {},
                child: Text('Login', style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }
}
