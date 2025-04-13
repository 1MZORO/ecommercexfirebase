import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerifiedCubit extends Cubit<OtpVerifiedState> {
  final TextEditingController otpController = TextEditingController();
  Timer? _timer;

  OtpVerifiedCubit() : super(OtpVerifiedState(remainingTime: 60)) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    emit(OtpVerifiedState(remainingTime: 60));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime > 0) {
        emit(state.copyWith(remainingTime: state.remainingTime - 1));
      } else {
        timer.cancel();
        emit(state.copyWith(isExpired: true));
      }
    });
  }

  void resendOtp() {
    _startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    otpController.dispose();
    return super.close();
  }
}

class OtpVerifiedState {
  final int remainingTime;
  final bool isExpired;

  OtpVerifiedState({
    required this.remainingTime,
    this.isExpired = false,
  });

  OtpVerifiedState copyWith({
    int? remainingTime,
    bool? isExpired,
  }) {
    return OtpVerifiedState(
      remainingTime: remainingTime ?? this.remainingTime,
      isExpired: isExpired ?? this.isExpired,
    );
  }
}