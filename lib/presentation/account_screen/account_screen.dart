import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: 'Account Screen'),),
    );
  }
}
