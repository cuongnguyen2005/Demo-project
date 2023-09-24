// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({super.key, required this.textButton});

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
          backgroundColor: MaterialStateProperty.all(maincolor),
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
        ),
        onPressed: () {
          // Navigator.pop(context);
        },
        child: Text(
          textButton,
          style: TextBlack16B(),
        ),
      ),
    );
  }
}
