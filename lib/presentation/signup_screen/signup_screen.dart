import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/presentation/signup_screen/signup_cubit.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/colors.dart';
import '../../utils/common_text.dart';
import '../../utils/common_textfield.dart';
import '../../utils/constants.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>SignupCubit(),
    child: BlocBuilder<SignupCubit,SignupState>(builder: (context,state){
      final cubit = context.read<SignupCubit>();
      return GestureDetector(
        onTap: ()=> unFocus(context),
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: size(context).width*numD04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size(context).width * numD20),
                GestureDetector(
                  onTap: (){
                    router.pop();
                  },
                  child: Container(
                    height: size(context).width*numD14,
                    width: size(context).width*numD14,
                    decoration: BoxDecoration(
                        color: colorLightTwo,
                        shape: BoxShape.circle
                    ),
                    child: Center(child: Icon(Icons.arrow_back_ios_new_rounded)),
                  ),
                ),
                SizedBox(height: size(context).width * numD05),                CommonText(
                  text: txCreateAccount,
                  fontSize: size(context).width * numD08,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: size(context).width * numD06),
                CommonTextField(
                  hintText: txUsername,
                ),
                SizedBox(height: size(context).width*numD03,),
                CommonTextField(
                  hintText: txEmailAddress,
                ),
                SizedBox(height: size(context).width*numD03,),
                CommonTextField(
                  hintText: txPassword,
                  showPassword: cubit.state.showPassword,
                  suffixIconWidget: InkWell(
                      onTap: (){
                        cubit.toggleShowPassword(cubit.state.showPassword!);
                      },
                      child: Transform.scale(scale: 0.5, child: Image.asset(cubit.state.showPassword! ? Assets.assetsHide : Assets.assetsShow,height: size(context).width*numD01,))),
                ),
                SizedBox(height: size(context).width*numD03,),
                CommonTextField(
                  hintText: txConfirmPassword,
                  showPassword: cubit.state.showConfirmPassword,
                  suffixIconWidget: InkWell(
                      onTap: (){
                        cubit.toggleShowConfirmPassword(cubit.state.showConfirmPassword!);
                      },
                      child: Transform.scale(scale: 0.5, child: Image.asset(cubit.state.showConfirmPassword! ? Assets.assetsHide : Assets.assetsShow,height: size(context).width*numD01,))),
                ),
                SizedBox(height: size(context).width*numD08,),
                CommonButton(onPressed: (){}, text: txContinue),
                SizedBox(height: size(context).width*numD05,),

                RichText(
                  text: TextSpan(
                    text: '$txForgotPassword$txQue',
                    style: TextStyle(color: colorBlack),
                    children: [
                      TextSpan(
                        text: txReset,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            router.push(AppRouter.forgotScreen);
                          },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }),
    );
  }
}
