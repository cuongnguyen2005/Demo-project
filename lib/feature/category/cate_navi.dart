// ignore_for_file: prefer_const_constructors

import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/feature/category/cate_expense.dart';
import 'package:finance_app/feature/category/cate_income.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class CateNavi extends StatelessWidget {
  const CateNavi({super.key});
  static String routeName = 'cate_navi';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // here the desired height
          child: AppBar(
            backgroundColor: AppColors.themeColor,
            bottom: TabBar(
              indicatorColor: AppColors.red,
              tabs: [
                Tab(
                  child: Text(
                    'Khoản Chi',
                    style: tStyle.H5(),
                  ),
                ),
                Tab(
                  child: Text(
                    'Khoản Thu',
                    style: tStyle.H5(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: const [
            CateExpense(),
            CateIncome(),
          ],
        ),
        bottomSheet: Container(
          width: double.infinity,
          color: AppColors.white,
          padding: const EdgeInsets.all(16),
          child: ButtonNoBox(
            textButton: 'Quay về',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
