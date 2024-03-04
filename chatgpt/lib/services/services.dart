import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widgets/dropdown.dart';
import '../widgets/text_widget.dart';

class Services{
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
            )
        ),

        context: context,
        backgroundColor: scaffoldBackgroundColor,
        builder: (context){
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: TextWidget(label: 'Chosen Modal',fontsize: 16,)),
                
                Flexible(
                    flex: 2,
                    child: ModalDropDownWidget())
              ],
            ),
          );
        });

  }
}