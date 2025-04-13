import 'colors.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final GlobalKey? formKey;
  final bool? showPassword;
  final Widget? suffixIconWidget;
  final FormFieldValidator<String>? validator;
  const CommonTextField({super.key, this.hintText, this.controller, this.formKey, this.showPassword, this.suffixIconWidget, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: controller,
      obscureText: showPassword ?? false,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintFadeDuration: Duration(milliseconds: 200),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(size(context).width*numD02)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorPurple),
            borderRadius: BorderRadius.circular(size(context).width*numD02)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorRed),
            borderRadius: BorderRadius.circular(size(context).width*numD02)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorRed),
            borderRadius: BorderRadius.circular(size(context).width*numD02)
        ),
        suffixIcon: suffixIconWidget,
        filled: true,
        fillColor: colorLightTwo,
      ),
    );

  }
}
