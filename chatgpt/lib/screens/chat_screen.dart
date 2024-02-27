import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Image.asset(AssetsManager.botImage),
        title: Text('ChatGPT', style: TextStyle(color: Colors.white),),
      ),
      body: Image.asset("assets/images/person.png"),
    );
  }
}
