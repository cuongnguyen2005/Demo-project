import 'package:flutter/material.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
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
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.themeColor,
              AppColors.orange,
            ],
          ),
        ),
        child: Center(
          child: Text(
            textButton,
            style: tStyle.H5W(),
          ),
        ),
      ),
    );
  }
}
