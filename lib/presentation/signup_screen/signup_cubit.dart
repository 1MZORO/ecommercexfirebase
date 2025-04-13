import 'dart:developer';
import 'package:ecommercexfirebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../routes/router.dart';
import '../../utils/common_widget.dart';
import '../../utils/constants.dart';

class SignupCubit extends Cubit<SignupState>{
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SignupCubit():super(SignupState(showPassword: true,showConfirmPassword: true));

  void toggleShowPassword(bool value){
    emit(state.copyWith(showPassword: value ? false : true));
  }

  void toggleShowConfirmPassword(bool value){
    emit(state.copyWith(showConfirmPassword: value ? false : true));
  }

  Future<void> signUpWithEmail(BuildContext context)async{
      try{
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passController.text.trim());
        log('User << ${userCredential.user}');
        showCustomToast(context, txSuccess);
        sharedPreferences.setString('user_email', emailController.text);
        router.goNamed(AppRouter.loginScreen);
      }on FirebaseAuthException catch(e){
        showCustomToast(context, '$txErrorInAuth $txSignup');
        log('Error ${e.toString()}');
      }
  }

  Future<void> signUpWithGoogle(BuildContext context) async {
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

}

class SignupState {
  final bool? showPassword;
  final bool? showConfirmPassword;

  SignupState({this.showConfirmPassword, this.showPassword});

  SignupState copyWith({
    final bool? showPassword,
    final bool? showConfirmPassword
  }){
    return SignupState(
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword
    );
  }

}