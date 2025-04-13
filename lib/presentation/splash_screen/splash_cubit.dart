import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/router.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashState()){
    Future.delayed(Duration(seconds: 2),(){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          log('<<$user');
          router.go(AppRouter.homeScreen);
        } else {
          router.go(AppRouter.loginScreen);
        }
      });
    });
  }

}

class SplashState {
}