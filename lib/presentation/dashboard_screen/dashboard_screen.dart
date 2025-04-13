import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/presentation/dashboard_screen/dashboard_cubit.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  const DashboardScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>DashBoardCubit(),
    child: BlocBuilder<DashBoardCubit,DashboardState>(builder: (context,state){
      final cubit = context.read<DashBoardCubit>();
      return Scaffold(
        body: child,
        bottomNavigationBar: Container(
          height: size(context).width*numD18,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: colorGrey.shade400)),
          ),
          child: BottomNavigationBar(
              onTap: (index){
                  cubit.changeIndex(index);
              },
              currentIndex: state.selectIndex!,
              backgroundColor: colorLightTwo,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
              unselectedLabelStyle: TextStyle(color: colorGrey,fontWeight: FontWeight.w500),
              selectedItemColor: colorBlack,
              unselectedItemColor: colorGrey,
              selectedIconTheme: IconThemeData(color: colorBlack),
              unselectedIconTheme: IconThemeData(color: colorGrey),
              type: BottomNavigationBarType.fixed,
              elevation: 1,
              items: [
                BottomNavigationBarItem(icon: Image.asset(Assets.assetsHomeIcon,height: size(context).width*numD07,color: state.selectIndex == 0 ? colorBlack:colorGrey,),label: 'Home'),
                BottomNavigationBarItem(icon: Image.asset(Assets.assetsOrderIcon,height: size(context).width*numD06,color: state.selectIndex == 1 ? colorBlack:colorGrey,),label: 'Order'),
                BottomNavigationBarItem(icon: Image.asset(Assets.assetsCartIcon,height: size(context).width*numD07,color: state.selectIndex == 2 ? colorBlack:colorGrey,),label: 'Cart'),
                BottomNavigationBarItem(icon: Image.asset(Assets.assetsPersonIcon,height: size(context).width*numD07,color: state.selectIndex == 3 ? colorBlack:colorGrey,),label: 'Profile'),
              ]),
        ),
      );
    }),
    );
  }
}
