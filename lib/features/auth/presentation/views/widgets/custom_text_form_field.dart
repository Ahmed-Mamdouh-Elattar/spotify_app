import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
  });
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 25,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
