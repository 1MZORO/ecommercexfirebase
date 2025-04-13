import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/router.dart';

class DashBoardCubit extends Cubit<DashboardState> {
  DashBoardCubit() : super(DashboardState(selectIndex: 0));

  void changeIndex(int index) {
    emit(state.copyWith(selectIndex: index));
    changeScreenOnTap();
  }

  changeScreenOnTap() {
    switch (state.selectIndex) {
      case 0:
        router.push(AppRouter.homeScreen);
        break;
      case 1:
        router.push(AppRouter.orderScreen);
        break;
      case 2:
        router.push(AppRouter.cartScreen);
        break;
      case 3:
        router.push(AppRouter.accountScreen);
        break;
    }
  }
}

class DashboardState{
  int? selectIndex;
  DashboardState({
    this.selectIndex,
  });

  DashboardState copyWith({
    int? selectIndex,
  })
  {
    return DashboardState(
      selectIndex: selectIndex??this.selectIndex,
    );
  }
}