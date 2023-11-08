// ignore_for_file: prefer_const_constructors

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/screen/income_expense/expense.dart';
import 'package:finance_app/screen/income_expense/income.dart';
import 'package:flutter/material.dart';

class IncomeAndExpense extends StatelessWidget {
  const IncomeAndExpense({super.key});

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
                    'Khoản Thu',
                    style: tStyle.H5(),
                  ),
                ),
                Tab(
                  child: Text(
                    'Khoản Chi',
                    style: tStyle.H5(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: const [
            Income(),
            Expense(),
          ],
        ),
      ),
    );
  }
}