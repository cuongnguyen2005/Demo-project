import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.text});
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      elevation: 2,
      backgroundColor: AppColors.themeColor,
      title: Center(
        child: Text(
          text,
          style: tStyle.H5(),
        ),
      ),
    );
  }
}
