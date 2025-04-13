import 'package:ecommercexfirebase/presentation/forgot_screen/forgot_cubit.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/common_text.dart';
import '../../utils/common_textfield.dart';
import '../../utils/constants.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotCubit,ForgotState>(builder: (context,state){
      final cubit = context.read<ForgotCubit>();
      return Scaffold(
        body: Form(
          key: cubit.formKey,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: size(context).width * numD04,
            ),
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
                SizedBox(height: size(context).width * numD05),
                CommonText(
                  text: txForgotPassword,
                  fontSize: size(context).width * numD09,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: size(context).width * numD06),
                CommonTextField(
                  hintText: txEmailAddress,
                  controller: cubit.emailForgotController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return txFieldCanNotBeEmptyValidation;
                    }
                    if (!emailRegex.hasMatch(
                      value.trim(),
                    )) {
                      return txEnterValidEmailValidation;
                    }
                    return null;
                  },
                ),
                SizedBox(height: size(context).width*numD08,),
                CommonButton(onPressed: (){
                  if(cubit.formKey.currentState!.validate()){
                    cubit.forgotPassword(context);
                    router.push(AppRouter.forgotSuccessScreen,extra: cubit);
                  }
                }, text: txContinue)
              ],
            ),
          ),
        ),
      );
    });
  }
}
