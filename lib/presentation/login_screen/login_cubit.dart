import 'dart:developer';

import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();
  final pageController = PageController();
  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  LoginCubit() : super(LoginState(currentPage: 0,showPassword: true)) {
    pageController.addListener(() {
      final page = pageController.page?.round() ?? 0;
      if (page != state.currentPage) {
        emit(state.copyWith(currentPage: page));
      }
    });
  }

  void toggleShowPassword(bool value){
    emit(state.copyWith(showPassword: value ? false : true));
  }

  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void previousPage() {
    pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  Future<void> signInWithEmail(BuildContext context)async{
       try{
         UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passController.text.trim());
         showCustomToast(context, txSuccess);
         log('User << ${userCredential.user}');
         router.goNamed(AppRouter.homeScreen);
       }on FirebaseAuthException catch(e){
         showCustomToast(context, '$txErrorInAuth $txLogin');
         debugPrint('Error ${e.toString()}');
       }
    }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      log('< ${userCredential.user} << ${googleUser} << ${googleAuth} << ${credential}>');
      showCustomToast(context, txSuccess);
      router.go(AppRouter.homeScreen);
    } catch (e) {
      showCustomToast(context, '$txErrorInAuth $txLogin');
      debugPrint("Error during Google sign-in: $e");
    }
  }

  // ---end
}

class LoginState {
  final int currentPage;
  final bool? showPassword;
  LoginState({this.showPassword, required this.currentPage});

  LoginState copyWith({int? currentPage,bool? showPassword}) {
    return LoginState(
      currentPage: currentPage ?? this.currentPage,
      showPassword: showPassword ?? this.showPassword
    );
  }
}
