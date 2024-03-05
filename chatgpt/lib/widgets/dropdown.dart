// import 'package:chatgpt/constant/constant.dart';
// import 'package:chatgpt/models/models_models.dart';
// import 'package:chatgpt/services/api_services.dart';
// import 'package:chatgpt/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
//
// class ModalDropDownWidget extends StatefulWidget {
//   const ModalDropDownWidget({super.key});
//
//   @override
//   State<ModalDropDownWidget> createState() => _ModalDropDownWidgetState();
// }
//
// class _ModalDropDownWidgetState extends State<ModalDropDownWidget> {
//   String currentModals = "text-embedding-3-small";
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ModelsModel>>(
//         future: ApiService.getModels(),
//         builder: (context,snapshot){
//           if(snapshot.hasError){
//             return Center(child: TextWidget(label: snapshot.error.toString()),);
//           }
//           return snapshot.data == null || snapshot.data!.isEmpty ? SizedBox.shrink() :
//
//           DropdownButton(
//               dropdownColor: scaffoldBackgroundColor,
//               iconEnabledColor: Colors.white,
//               items: List<DropdownMenuItem<String>>.generate(snapshot.data!.length,
//                       // (index) => DropdownMenuItem(
//                       //     value: snapshot.data![index].id,
//                       //     child: TextWidget(label: snapshot.data![index].id,
//                       //     fontsize: 15,
//                       //     ))),
//                   (index) {
//                       final id = snapshot.data![index].id;
//                       return id != null ? DropdownMenuItem(
//                           value: id,
//                           child: TextWidget(label: id, fontsize: 15,
//                               ),
//                             )
//                           : null;
//                    },
//               ).where((items) => item != null).toList(),
//               value: currentModals,
//               onChanged: (value){
//                 setState(() {
//                   currentModals = value.toString();
//                 });
//               });
//         });
//   }
// }
//


import 'package:chatgpt/constant/constant.dart';
import 'package:chatgpt/models/models_models.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getController/models.dart';

class ModalDropDownWidget extends StatefulWidget {
  const ModalDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ModalDropDownWidget> createState() => _ModalDropDownWidgetState();
}

class _ModalDropDownWidgetState extends State<ModalDropDownWidget> {
  String? currentModel = "tts-1"; // Change the type to nullable String

  @override
  Widget build(BuildContext context) {
    final modelController = Get.find<ModelsController>();
    return FutureBuilder<List<ModelsModel>>(
      future: modelController.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: TextWidget(label: snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        List<DropdownMenuItem<String>> items = snapshot.data!.map((model) {
          return DropdownMenuItem(
            value: model.id ?? "",
            child: TextWidget(label: model.id ?? "", fontsize: 15),
          );
        }).toList();

        return DropdownButton(
          dropdownColor: scaffoldBackgroundColor,
          iconEnabledColor: Colors.white,
          items: items,
          value: currentModel,
          onChanged: (value) {
            setState(() {
              currentModel = value.toString();
            });
          },
        );
      },
    );
  }
}
