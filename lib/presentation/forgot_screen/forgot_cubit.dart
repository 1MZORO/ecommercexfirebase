import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotCubit extends Cubit<ForgotState>{
  final emailForgotController = TextEditingController();
  final otpController = TextEditingController();
  final bool isValid = false;
  final formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;
  ForgotCubit():super(ForgotState());

  Future<void> forgotPassword(BuildContext context)async{
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: emailForgotController.text);
      showCustomToast(context, txSuccess);
    }on FirebaseAuthException catch(e){
      showCustomToast(context, txFailed);
      debugPrint('Error ${e.toString()}');
    }

  }
}

class ForgotState {
}