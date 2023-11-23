import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/source/colors.dart';

class TabBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const TabBarDefault({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;
  final String text2;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.grey),
        ),
        color: AppColors.white,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 50, right: 50, top: 45, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey,
        ),
        child: TabBar(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themeColor,
          ),
          tabs: [
            Tab(
              child: Text(
                text1,
                style: tStyle.H5(),
              ),
            ),
            Tab(
              child: Text(
                text2,
                style: tStyle.H5(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
