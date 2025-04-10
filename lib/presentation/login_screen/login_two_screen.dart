import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/common_textfield.dart';
import '../../utils/common_widget.dart';

class LoginTwoScreen extends StatelessWidget {
  const LoginTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocus(context),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: size(context).width * numD03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size(context).width * numD30),
              CommonText(
                text: txSignIn,
                fontSize: size(context).width * numD095,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: size(context).width * numD06),
              CommonTextField(hintText: txPassword,),
              SizedBox(height: size(context).width * numD06),
              CommonButton(onPressed: (){}, text: txContinue,),
              SizedBox(height: size(context).width * numD04),
              RichText(text: TextSpan(
                  text: txForgotPassword,
                  style: TextStyle(color: colorBlack),
                  children: [
                    TextSpan(
                        text: txReset,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          debugPrint('Create account');
                        }
                    )
                  ]
              )),

            ],
          ),
        ),
      ),
    );
  }
}
