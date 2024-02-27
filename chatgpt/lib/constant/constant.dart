import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444653);


List<String> models = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
];

List<DropdownMenuItem<String>>? get getModalsItem{
  List<DropdownMenuItem<String>>? modelsItems = List<DropdownMenuItem<String>>.generate(models.length, (index) => DropdownMenuItem(
      value: models[index],
      child: TextWidget(label: models[index], fontsize: 15,)));
  return modelsItems;
}

// List<DropdownMenuItem<String>> getModalsItem() {
//   return List<DropdownMenuItem<String>>.generate(
//     models.length,
//         (index) => DropdownMenuItem(
//       value: models[index],
//       child: TextWidget(label: models[index], fontsize: 15,),
//     ),
//   );
// }


final chatMessages = [
  {
    "msg": "hellow who are you",
    "chatIndex": 0,
  },

  {
    "msg": "I am ChatGPT , i am produce by open AI for making research easy and fast",
    "chatIndex": 1,
  },

  {
    "msg": "What is flutter",
    "chatIndex": 0,
  },

  {
    "msg": "Flutter is an open source mobile aplication development framework powered by Google.",
    "chatIndex": 1,
  },

  {
    "msg": "hellow who are you",
    "chatIndex": 0,
  },

  {
    "msg": "I am ChatGPT , i am produce by open AI for making research easy and fast",
    "chatIndex": 1,
  },

  {
    "msg": "What is flutter",
    "chatIndex": 0,
  },

  {
    "msg": "Flutter is an open source mobile aplication development framework powered by Google.",
    "chatIndex": 1,
  },

  {
    "msg": "hellow who are you",
    "chatIndex": 0,
  },

  {
    "msg": "I am ChatGPT , i am produce by open AI for making research easy and fast",
    "chatIndex": 1,
  },

  {
    "msg": "What is flutter",
    "chatIndex": 0,
  },

  {
    "msg": "Flutter is an open source mobile aplication development framework powered by Google.",
    "chatIndex": 1,
  },

];