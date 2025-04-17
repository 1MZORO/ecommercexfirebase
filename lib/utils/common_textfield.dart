import 'colors.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final GlobalKey? formKey;
  final bool? showPassword;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final Function? onTap;
  final TextInputType? keyboardType ;
  const CommonTextField({super.key, this.hintText, this.controller, this.formKey, this.showPassword, this.suffixIconWidget, this.validator, this.readOnly, this.onTap, this.keyboardType = TextInputType.text, this.prefixIconWidget});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      textInputAction: TextInputAction.next,
      controller: controller,
      obscureText: showPassword ?? false,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: colorGrey),
        hintFadeDuration: Duration(milliseconds: 200),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(size(context).width*numD03)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorGrey),
            borderRadius: BorderRadius.circular(size(context).width*numD03)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorGrey.shade300),
            borderRadius: BorderRadius.circular(size(context).width*numD03)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorRed),
            borderRadius: BorderRadius.circular(size(context).width*numD03)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorRed),
            borderRadius: BorderRadius.circular(size(context).width*numD03)
        ),
        prefixIcon: prefixIconWidget,
        suffixIcon: suffixIconWidget,
        filled: true,
        fillColor: colorWhite,
      ),
      readOnly: readOnly ?? false,
      onTap: ()=> onTap?.call(),
    );

  }
}
