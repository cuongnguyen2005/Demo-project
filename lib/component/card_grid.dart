// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({
    Key? key,
    required this.iconData,
    required this.gridColor1,
    required this.gridColor2,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final Color gridColor1;
  final Color gridColor2;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.3),
                spreadRadius: 3, //tán shadow
                blurRadius: 10, //độ mờ shadow
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                gridColor1,
                gridColor2,
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 80,
              color: white,
            ),
            Text(
              text,
              style: TextWhite16B(),
            )
          ],
        ),
      ),
    );
  }
}
