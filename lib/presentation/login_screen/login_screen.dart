import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size(context).width*numD1,
            decoration: BoxDecoration(
              color: colorLightTwo,
              shape: BoxShape.circle
            ),
          ),
        ],
      ),
    );
  }
}
