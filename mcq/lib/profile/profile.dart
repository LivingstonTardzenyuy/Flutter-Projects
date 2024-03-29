import 'package:flutter/material.dart';
import 'package:mcq/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthService().anonSignOut();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: Text('Signout'),
        ),
      ),
    );
  }
}
