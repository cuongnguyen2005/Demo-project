import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    Key? key,
    required this.textButton,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
          border: Border.all(color: AppColors.themeColor, width: 2),
        ),
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: tStyle.H5(),
        ),
      ),
    );
  }
}
