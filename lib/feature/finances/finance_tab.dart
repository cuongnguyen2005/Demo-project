import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:finance_app/feature/finances/income.dart';
import 'package:finance_app/feature/finances/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinanceTabbar extends StatelessWidget {
  const FinanceTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBarDefault(
            text1: AppLocalizations.of(context)!.expense,
            text2: AppLocalizations.of(context)!.income),
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
