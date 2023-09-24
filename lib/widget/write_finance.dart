// ignore_for_file: prefer_const_constructors

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/widget/expense.dart';
import 'package:finance_app/widget/income.dart';
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
            backgroundColor: maincolor,
            bottom: TabBar(
              indicatorColor: red,
              tabs: [
                Tab(
                  child: Text(
                    'Khoản Thu',
                    style: TextBlack16B(),
                  ),
                ),
                Tab(
                  child: Text(
                    'Khoản Chi',
                    style: TextBlack16B(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Income(),
            Expense(),
          ],
        ),
      ),
    );
  }
}
