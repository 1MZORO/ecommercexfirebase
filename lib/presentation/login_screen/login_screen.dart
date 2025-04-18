import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/presentation/login_screen/login_cubit.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/assets.dart';
import '../../theme/theme_cubit.dart';
import '../../utils/common_textfield.dart';
import '../../utils/common_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.themeMode;
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
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                                      )
                                      : CommonTextField(
                                        hintText: txPassword,
                                        controller: cubit.passController,
                                        showPassword: cubit.state.showPassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return txFieldCanNotBeEmptyValidation;
                                          }
                                          if (!passwordRegex.hasMatch(value)) {
                                            return txEnterValidPassValidation;
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
                                            scale: 0.4,
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
                                      if (index == 0) {
                                        if (cubit.emailFormKey.currentState!.validate()) {
                                          cubit.nextPage();
                                        }
                                      } else {
                                        if (cubit.passFormKey.currentState!.validate()) {
                                          cubit.signInWithEmail(context);
                                        }
                                      }
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
                                            onPressed: () {
                                              showCustomToast(context, 'Coming soon');
                                            },
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
                                            onPressed: () {
                                              cubit.signInWithGoogle(context);
                                            },
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
                                  SizedBox(height: 30,),
                                  Switch(value: context.read<ThemeCubit>().value,
                                    onChanged: (value) {
                                      context.read<ThemeCubit>().toggleTheme(value);
                                    },)
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
