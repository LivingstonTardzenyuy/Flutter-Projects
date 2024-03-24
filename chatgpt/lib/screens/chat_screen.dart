import 'dart:developer';

import 'package:chatgpt/constant/constant.dart';
import 'package:chatgpt/models/models_models.dart';
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

  // final List<ChatModel> chatMessages = []; // Create a list to hold chat messages
  bool _isTyping = false;
  late TextEditingController textEditingController;

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
  final modelController = Get.find<ModelsController>();
  List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {

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
            Flexible(
              child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index){
                    return ChatWidget(
                      msg: chatList[index].msg,
                      chatIndex: chatList[index].chatIndex);
                  }),
            ),
            if(_isTyping)...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),],
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
                        onSubmitted: (value) async{
                          await sendMessageFCT(modelsController: modelController);
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "How Can i help you",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),

                    IconButton(
                        onPressed: () async{
                          await sendMessageFCT(modelsController: modelController);
                        },
                        icon: Icon(Icons.send, color: Colors.white,))
                  ],
                ),
              ),
            ),
          ],
        // ],
        ),
      )
    );
  }


  Future<void> sendMessageFCT ({required ModelsController modelsController}) async {
     try {
        setState(() {
        _isTyping = true;
        chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        textEditingController.clear();
        });

      chatList.addAll(await ApiService.sendMessage(message: textEditingController.text, modelId: modelController.getCurrentModel ?? ''));
      setState(() {

      });
     } catch (error){
        log("error $error");
     } finally{
      _isTyping = false;
    }
  }
}
