import 'package:flutter/material.dart';

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';

class ButtonSelectDay extends StatelessWidget {
  const ButtonSelectDay({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: tStyle.medium(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
