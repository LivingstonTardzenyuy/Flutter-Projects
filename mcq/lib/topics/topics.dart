import 'package:flutter/material.dart';

import '../shared/botton_nav.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottonNavBar(),
    );
  }
}
