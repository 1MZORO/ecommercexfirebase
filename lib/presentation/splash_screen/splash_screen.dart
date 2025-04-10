import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      router.push(AppRouter.loginOneScreen);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: colorLightOne,
          body: Center(
            child: Lottie.asset(
              Assets.assetsSplashAnimation,
              fit: BoxFit.cover,
            ),
          ),
        );
  }
}