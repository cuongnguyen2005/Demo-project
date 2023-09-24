// ignore_for_file: prefer_const_constructors
//Box hiển thị số tiền và nội dung của box

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {super.key,
      required this.title,
      required this.content,
      required this.color});

  final String title;
  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: maincolor,
            width: 2,
          )),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: TextDynamic16B(
                color: color,
              )),
          SizedBox(
            height: 5,
          ),
          Text(content,
              style: HealingDynamic20B(
                color: color,
              )),
        ],
      ),
    );
  }
}
