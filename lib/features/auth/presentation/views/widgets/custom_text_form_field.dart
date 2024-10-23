import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  });
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
