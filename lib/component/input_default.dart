// ignore_for_file: prefer_const_constructors

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class InputDefault extends StatelessWidget {
  const InputDefault({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
