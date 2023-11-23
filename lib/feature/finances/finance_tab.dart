import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:finance_app/feature/finances/expense/bloc/expense_bloc.dart';
import 'package:finance_app/feature/finances/income/bloc/income_bloc.dart';
import 'package:finance_app/feature/finances/income/income.dart';
import 'package:finance_app/feature/finances/expense/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            BlocProvider(
              create: (context) => ExpenseBloc(),
              child: ExpensePage(arg: ExpensePageArg(isUpdate: false)),
            ),
            BlocProvider(
              create: (context) => IncomeBloc(),
              child: IncomePage(arg: IncomePageArg(isUpdate: false)),
            ),
          ],
        ),
      ),
    );
  }
}
