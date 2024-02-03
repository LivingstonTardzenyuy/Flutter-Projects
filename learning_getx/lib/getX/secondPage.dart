import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
