import 'package:ecommercexfirebase/presentation/account_screen/account_cubit.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AccountCubit(),
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            final cubit = context.read<AccountCubit>();
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: size(context).width * numD03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size(context).width*numD25,
                    height: size(context).width*numD25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorLightTwo
                    ),
                    child: Icon(Icons.person,size: size(context).width*numD14,),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.state.list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              // router.push(AppRouter.addProductScreen);
                              break;
                            case 1:
                              router.push(AppRouter.addProductScreen);
                              break;
                            case 2:
                              // router.push(AppRouter.cartScreen);
                              break;
                            case 3:
                              // router.push(AppRouter.accountScreen);
                              break;
                          }
                        },
                        child: Container(
                          height: size(context).width * numD14,
                          width: size(context).width,
                          margin: EdgeInsets.only(
                            bottom: size(context).width * numD03,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: size(context).width * numD03,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              size(context).width * numD03,
                            ),
                            border: Border.all(color: colorGrey.shade300),
                            color: colorLightTwo,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: cubit.state.list[index],
                                fontSize: size(context).width * numD04,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: size(context).width * numD05,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      router.goNamed(AppRouter.loginScreen);
                    },
                    child: CommonText(text: txSignOut ,fontSize: size(context).width*numD045,color: colorRed,),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
