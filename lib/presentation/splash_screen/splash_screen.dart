import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/presentation/splash_screen/splash_cubit.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocProvider(create: (_)=>SplashCubit(),
        child: BlocBuilder<SplashCubit,SplashState>(builder: (context,state){
          return Scaffold(
            backgroundColor: colorLightOne,
            body: Center(
              child: Lottie.asset(
                Assets.assetsSplashAnimation,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
        );
  }
}