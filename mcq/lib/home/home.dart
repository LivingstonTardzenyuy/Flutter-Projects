import 'package:flutter/material.dart';
import 'package:mcq/services/auth.dart';
import 'package:mcq/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text('Loading');
          } else if(snapshot.hasError){
            return const Center(
              child: Text("Error")
            );
          } else if (snapshot.hasData){
            return const TopicsScreen();
          }
        });
  }
}
