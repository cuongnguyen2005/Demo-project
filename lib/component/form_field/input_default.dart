import 'package:flutter/material.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';

class InputDefault extends StatelessWidget {
  const InputDefault({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.autovalidateMode,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      controller: controller,
      style: tStyle.medium(),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColors.themeColor.withOpacity(0.2),
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
      ),
    );
  }
}
