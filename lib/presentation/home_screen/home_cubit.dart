import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeState(isFav: false));

  void toggle(bool value){
    emit(state.copyWith(isFav: value ? false : true));
  }

}

class HomeState {
  bool isFav;

  HomeState({required this.isFav});

  HomeState copyWith({bool? isFav}){
    return HomeState(isFav: isFav ?? this.isFav);
  }
}