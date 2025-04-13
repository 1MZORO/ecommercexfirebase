import 'package:flutter/material.dart';
import '../../utils/common_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: 'Cart Screen'),),

    );
  }
}
