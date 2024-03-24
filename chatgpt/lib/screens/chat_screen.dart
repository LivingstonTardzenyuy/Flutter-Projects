import 'dart:developer';

import 'package:chatgpt/constant/constant.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../getController/models.dart';
import '../models/chat_model.dart';
import '../services/assets_manager.dart';
import '../services/services.dart';
import '../widgets/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<ChatModel> chatMessages = []; // Create a list to hold chat messages
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  void addMessageToChat(ChatModel message) {
    setState(() {
      chatMessages.add(message);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final modelController = Get.find<ModelsController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Image.asset(AssetsManager.botImage),
        title: Text('ChatGPT', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: () async{
                await Services.showModalSheet(context: context);
              },
              icon: Icon(Icons.more_vert_rounded, color: Colors.white,),),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Flexible(
            //   child: ListView.builder(
            //       itemCount: 6,
            //       itemBuilder: (context, index){
            //         return ChatWidget(
            //           msg: chatMessages[index]['msg'].toString(),
            //           chatIndex: int.parse(chatMessages[index]['chatIndex'].toString()),);
            //       }),
            // ),

            Flexible(
              child: ListView.builder(
                itemCount: chatMessages.length, // Use the length of chatMessages list
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatMessages[index].msg,
                    chatIndex: chatMessages[index].chatIndex,
                  );
                },
              ),
            ),

            if(_isTyping)...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
            SizedBox(height: 15,),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: textEditingController,
                        onSubmitted: (value){
                          //Todo send message
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "How Can i help you",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),

                    IconButton(
                        onPressed: () async {
                          // try {
                          //     await ApiService.sendMessage(message: textEditingController.text, modelId: modelController.getCurrentModel ?? '');
                          // } catch (error){
                          //   log("error $error");
                          // }
                          ApiService apiService = ApiService(); // Create an instance of ApiService
                          await apiService.sendMessage(
                            message: textEditingController.text,
                            modelId: modelController.getCurrentModel ?? '',
                            onMessageReceived: addMessageToChat, // Pass the callback function
                          );

                        },
                        icon: Icon(Icons.send, color: Colors.white,))
                  ],
                ),
              ),
            ),
          ],
        ],
        ),
      )
    );
  }
}
