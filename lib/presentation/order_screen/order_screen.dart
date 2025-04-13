import 'package:flutter/material.dart';
import '../../utils/common_text.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: 'Order Screen'),),
    );
  }
}
