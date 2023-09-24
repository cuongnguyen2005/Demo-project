// ignore_for_file: prefer_const_constructors

import 'package:finance_app/colors.dart';
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
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Khoản Chi',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w700,
                    ),
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
