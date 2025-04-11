import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit():super(SignupState(showPassword: true,showConfirmPassword: true));

  void toggleShowPassword(bool value){
    emit(state.copyWith(showPassword: value ? false : true));
  }

  void toggleShowConfirmPassword(bool value){
    emit(state.copyWith(showConfirmPassword: value ? false : true));
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