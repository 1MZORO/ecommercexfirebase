import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();
  final pageController = PageController();

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
