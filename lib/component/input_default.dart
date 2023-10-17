// ignore_for_file: prefer_const_constructors

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class InputDefault extends StatelessWidget {
  const InputDefault({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.autovalidateMode,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      controller: controller,
      style: medium(),
      decoration: InputDecoration(
        fillColor: lightYellow,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
      ),
    );
  }
}
