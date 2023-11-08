// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:finance_app/source/typo.dart';

class ButtonNoBox extends StatelessWidget {
  const ButtonNoBox({
    Key? key,
    required this.textButton,
    this.onTap,
  }) : super(key: key);

  final String textButton;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        textButton,
        style: tStyle.H5Blue(),
      ),
    );
  }
}
