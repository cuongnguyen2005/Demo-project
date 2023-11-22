import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:finance_app/feature/category/cate_default/expense/cate_expense_default_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'expense/bloc/cate_expense_default_bloc.dart';
import 'income/bloc/cate_income_default_bloc.dart';
import 'income/cate_income_default_management.dart';

class CateDefaultTab extends StatelessWidget {
  const CateDefaultTab({super.key});
  static String routeName = 'cate_default';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), // here the desired height
          child: TabBarDefault(
              text1: AppLocalizations.of(context)!.expense,
              text2: AppLocalizations.of(context)!.income),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => CateExpenseDefaultBloc(),
              child: const CateExpenseDefaultManagement(),
            ),
            BlocProvider(
              create: (context) => CateIncomeDefaultBloc(),
              child: const CateIncomeDefaultManagement(),
            ),
          ],
        ),
        bottomSheet: const BottomSheetButton(),
      ),
    );
  }
}
