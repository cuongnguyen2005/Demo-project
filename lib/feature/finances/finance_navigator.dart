// ignore_for_file: prefer_const_constructors

import 'package:finance_app/feature/finances/income.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/feature/finances/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinanceNavi extends StatelessWidget {
  const FinanceNavi({super.key});

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
                    AppLocalizations.of(context)!.expense,
                    style: tStyle.H5(),
                  ),
                ),
                Tab(
                  child: Text(
                    AppLocalizations.of(context)!.income,
                    style: tStyle.H5(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ExpensePage(arg: ExpensePageArg(isUpdate: false)),
            IncomePage(arg: IncomePageArg(isUpdate: false)),
          ],
        ),
      ),
    );
  }
}
