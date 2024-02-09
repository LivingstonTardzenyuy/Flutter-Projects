import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class OTP extends StatelessWidget {
  OTP({
    required this.otpFieldControllerV2,
  });
  final OtpFieldControllerV2 otpFieldControllerV2;

  @override
  Widget build(BuildContext context) {
    return OTPTextFieldV2(
      controller: otpFieldControllerV2,
      length: 5,
      width: MediaQuery.of(context).size.width,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 45,
      fieldStyle: FieldStyle.box,
      outlineBorderRadius: 15,
      style: TextStyle(fontSize: 17),
      onChanged: (pin) {
        print("Changed: " + pin);
      },
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }
}
