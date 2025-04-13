import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';
import 'forgot_cubit.dart';

class ForgotSuccessScreen extends StatelessWidget {
  const ForgotSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotCubit>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: size(context).width*numD80,),
          Image.asset(
            Assets.assetsForgotMessageLogo,
            height: size(context).width * numD22,
          ),
          SizedBox(height: size(context).width * numD04),
          CommonText(
            text: txForgotSuccessMessage,
            fontSize: size(context).width * numD055,
            fontWeight: FontWeight.w600,
            alignment: TextAlign.center,
          ),
          SizedBox(height: size(context).width * numD04),
          CommonButton(
            onPressed: () {
              router.push(AppRouter.otpVerifiedScreen,extra: cubit);
            },
            text: txContinue,
            width: size(context).width * numD40,
          ),
        ],
      ),
    );
  }
}
