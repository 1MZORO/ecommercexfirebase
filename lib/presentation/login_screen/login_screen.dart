import 'dart:developer';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/presentation/login_screen/login_cubit.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return PopScope(
          canPop: cubit.state.currentPage == 0,
          onPopInvoked: (didPop) {
            if (!didPop && cubit.state.currentPage > 0) {
              cubit.previousPage();
            }
          },
          child: GestureDetector(
            onTap: () {
              unFocus(context);
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: size(context).height,
                  margin: EdgeInsets.symmetric(
                    horizontal: size(context).width * numD04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size(context).width * numD30),
                      CommonText(
                        text: txSignIn,
                        fontSize: size(context).width * numD09,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: size(context).width * numD06),
                      Expanded(
                        child: PageView.builder(
                          controller: cubit.pageController,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Form(
                              key:
                                  index == 0
                                      ? cubit.emailFormKey
                                      : cubit.passFormKey,
                              child: Column(
                                children: [
                                  index == 0
                                      ? CommonTextField(
                                        hintText: txEmailAddress,
                                        controller: cubit.emailController,
                                        validator: (value) {
                                          log('<<< $value');
                                          if (value!.trim().isEmpty) {
                                            return 'Please enter an email';
                                          }
                                          if (!emailRegex.hasMatch(
                                            value.trim(),
                                          )) {
                                            return 'Enter a valid email';
                                          }
                                          return null;
                                        },
                                      )
                                      : CommonTextField(
                                        hintText: txPassword,
                                        controller: cubit.passController,
                                        showPassword: cubit.state.showPassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter an Password';
                                          }
                                          if (!passwordRegex.hasMatch(value)) {
                                            return 'Enter a valid Password';
                                          }
                                          return null;
                                        },
                                        suffixIconWidget: InkWell(
                                          onTap: () {
                                            cubit.toggleShowPassword(
                                              cubit.state.showPassword!,
                                            );
                                          },
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: Image.asset(
                                              cubit.state.showPassword!
                                                  ? Assets.assetsHide
                                                  : Assets.assetsShow,
                                              height:
                                                  size(context).width * numD01,
                                            ),
                                          ),
                                        ),
                                      ),
                                  SizedBox(
                                    height: size(context).width * numD04,
                                  ),
                                  CommonButton(
                                    onPressed: () {
                                      cubit.state.currentPage == 0
                                          ? cubit.nextPage()
                                          : router.push(AppRouter.homeScreen);
                                    },
                                    text: txContinue,
                                  ),
                                  SizedBox(
                                    height: size(context).width * numD04,
                                  ),
                                  index == 0
                                      ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: txDontHaveAccount,
                                              style: TextStyle(
                                                color: colorBlack,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: txCreateOne,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          router.push(
                                                            AppRouter
                                                                .signupScreen,
                                                          );
                                                        },
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                size(context).width * numD16,
                                          ),
                                          CommonButton(
                                            onPressed: () {},
                                            text: txContinueWithApple,
                                            leadingIconPath:
                                                Assets.assetsAppleLogo,
                                            backgroundColor: colorLightTwo,
                                            textColor: colorBlack,
                                          ),
                                          SizedBox(
                                            height:
                                                size(context).width * numD04,
                                          ),
                                          CommonButton(
                                            onPressed: () {},
                                            text: txContinueWithGoogle,
                                            leadingIconPath:
                                                Assets.assetsGoogleLogo,
                                            backgroundColor: colorLightTwo,
                                            textColor: colorBlack,
                                          ),
                                        ],
                                      )
                                      : Align(
                                        alignment: Alignment.centerLeft,
                                        child: RichText(
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
                                                        router.push(
                                                          AppRouter
                                                              .forgotScreen,
                                                        );
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
