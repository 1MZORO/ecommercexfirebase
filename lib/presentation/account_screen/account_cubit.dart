import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCubit extends Cubit<AccountState>{

  AccountCubit():super(AccountState(list: ['Edit Profile','Add Products','Address','Wishlist','Payments','Help','Support']));

}

class AccountState {
  List<String> list;

  AccountState({required this.list});

  AccountState copyWith({List<String>? list}){
    return AccountState(list: list ?? this.list);
  }
}