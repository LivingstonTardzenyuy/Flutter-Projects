import 'package:chatgpt/constant/constant.dart';
import 'package:flutter/material.dart';

class ModalDropDownWidget extends StatefulWidget {
  const ModalDropDownWidget({super.key});

  @override
  State<ModalDropDownWidget> createState() => _ModalDropDownWidgetState();
}

class _ModalDropDownWidgetState extends State<ModalDropDownWidget> {
  String currentModals = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        dropdownColor: scaffoldBackgroundColor,
        iconEnabledColor: Colors.white,
        items: getModalsItem,
        value: currentModals,
        onChanged: (value){
          setState(() {
            currentModals = value.toString();
          });
    });
  }
}
