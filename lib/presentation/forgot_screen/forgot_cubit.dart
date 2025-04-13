import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotCubit extends Cubit<ForgotState>{
  final emailForgotController = TextEditingController();
  final otpController = TextEditingController();
  final bool isValid = false;
  ForgotCubit():super(ForgotState());

}

class ForgotState {
}