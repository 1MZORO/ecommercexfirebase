import 'dart:math';

import 'package:ecommercexfirebase/presentation/login_screen/login_cubit.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/assets.dart';
import '../../utils/common_textfield.dart';
import '../../utils/common_widget.dart';

class LoginOneScreen extends StatelessWidget {
  const LoginOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginState>(builder: (context,state){
      final cubit = context.read<LoginCubit>();
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
                CommonTextField(hintText: txEmailAddress,key: cubit.formKey,controller: cubit.emailController,),
                SizedBox(height: size(context).width * numD06),
                CommonButton(onPressed: (){
                  router.push(AppRouter.loginTwoScreen,extra: cubit);
                }, text: txContinue,),
                SizedBox(height: size(context).width * numD04),
                RichText(text: TextSpan(
                    text: txDontHaveAccount,
                    style: TextStyle(color: colorBlack),
                    children: [
                      TextSpan(
                          text: txCreateOne,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            debugPrint('Create account');
                          }
                      )
                    ]
                )),
                SizedBox(height: size(context).width * numD04),
                CommonButton(onPressed: (){}, text: txContinueWithApple,leadingIconPath: Assets.assetsAppleLogo,backgroundColor: colorLightTwo,textColor: colorBlack,),
                SizedBox(height: size(context).width * numD04),
                CommonButton(onPressed: (){
                }, text: txContinueWithGoogle,leadingIconPath: Assets.assetsGoogleLogo,backgroundColor: colorLightTwo,textColor: colorBlack,),
                SizedBox(height: size(context).width * numD04),

              ],
            ),
          ),
        ),
      );
    },
    );
  }
}
