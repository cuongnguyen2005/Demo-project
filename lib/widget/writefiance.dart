import 'package:finance_app/colors.dart';
import 'package:finance_app/component/buttonPrimary.dart';
import 'package:finance_app/component/textBox.dart';
import 'package:finance_app/widget/expense.dart';
import 'package:finance_app/widget/income.dart';
import 'package:flutter/material.dart';

import '../component/boxDetail.dart';

class IncomeAndExpense extends StatelessWidget {
  const IncomeAndExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          children: [
            TabBar(
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
            Expanded(
              child: TabBarView(
                children: [
                  Income(),
                  Expense(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
