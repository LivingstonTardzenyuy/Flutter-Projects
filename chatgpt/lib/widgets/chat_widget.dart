import 'package:chatgpt/constant/constant.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(AssetsManager.userimage,
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 10,),
                TextWidget(
                    label: "Hello here our msg")
              ],
            ),
          ),
        )
      ],

    );
  }
}
