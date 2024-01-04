import 'package:flutter/material.dart';

import '../shared/botton_nav.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottonNavBar(),
      appBar: AppBar(
        title: Text("About Page"),
      ),
      body: Container(
        child: Center(
          child: Text("About screen"),
        ),
      ),
    );
  }
}
