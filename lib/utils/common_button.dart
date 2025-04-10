import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final String? leadingIconPath;
  final Color? backgroundColor;
  final Color? textColor;
  const CommonButton({super.key,required this.onPressed, required this.text, this.leadingIconPath, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: backgroundColor ?? colorPurple,
      minimumSize: Size(size(context).width, size(context).width*numD12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size(context).width*numD06), // Rounded corners
      ),
    ) ,onPressed: onPressed,
        child: Row(
      mainAxisAlignment: leadingIconPath != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
      children: [
        leadingIconPath != null ? ClipRRect(child: Image.asset(leadingIconPath!,height: size(context).width*numD06,)) : Container(),
        CommonText(text: text,color: textColor??colorWhite,fontSize: size(context).width*numD04,),
        Container()
      ],
    ));
  }
}
