import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size(context).width*numD04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(onPressed: ()async{
             await FirebaseAuth.instance.signOut();
             router.goNamed(AppRouter.loginScreen);
            }, text: 'Logout')
          ],
        ),
      ),
    );
  }
}
