import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overFlow;
  final int? maxLine;
  final TextAlign? alignment;

  const CommonText(
      {super.key,
        required this.text,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.overFlow,
        this.alignment,
        this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: alignment,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          overflow: overFlow),
    );
  }
}