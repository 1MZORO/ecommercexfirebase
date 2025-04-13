import 'package:ecommercexfirebase/presentation/forgot_screen/forgot_cubit.dart';
import 'package:ecommercexfirebase/presentation/otp_verified_screen/otp_verified_cubit.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../routes/router.dart';

class OtpVerifiedScreen extends StatelessWidget {
  const OtpVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>OtpVerifiedCubit(),
    child: BlocBuilder<OtpVerifiedCubit,OtpVerifiedState>(builder: (context,state){
      final cubit = context.read<OtpVerifiedCubit>();
      return GestureDetector(
        onTap: () =>unFocus(context),
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: size(context).width*numD03),
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
                SizedBox(height: size(context).width * numD04),
                CommonText(text: txVerificationCode,fontWeight: FontWeight.w500,fontSize: size(context).width*numD06,color: colorBlack),
                SizedBox(height: size(context).width * numD01),
                CommonText(text: txForgotSuccessMessageTwo,fontWeight: FontWeight.w500,fontSize: size(context).width*numD04,color: colorGrey,),
                SizedBox(height: size(context).width * numD04),
                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    controller: cubit.otpController,
                    defaultPinTheme: PinTheme(
                      width: size(context).width*numD16,
                      height: size(context).width*numD13,
                      margin: EdgeInsets.symmetric(horizontal: size(context).width*numD005),
                      textStyle: TextStyle(fontSize: size(context).width*numD05, color: colorBlack),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorBlack),
                        borderRadius: BorderRadius.circular(size(context).width*numD03),
                      ),
                    ),
                    onCompleted: (pin) {
                      debugPrint("Entered OTP: $pin");
                    },
                  ),
                ),
                SizedBox(height: size(context).width * numD04),
                CommonButton(onPressed: (){
                }, text: txSubmit),
                SizedBox(height: size(context).width * numD04),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: txDidNotReceiveCode,
                      style: TextStyle(color: colorBlack),
                      children: [
                        cubit.state.remainingTime != 0 ? TextSpan(
                          text: ' ${cubit.state.remainingTime}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ):
                        TextSpan(
                          text: ' $txResend',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorRed.shade300
                          ),
                          recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              cubit.resendOtp();
                            },
                        ),
                      ],
                    ),
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
