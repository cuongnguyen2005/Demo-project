import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:finance_app/feature/category/cate_personal/expense/bloc/cate_expense_personal_bloc.dart';
import 'package:finance_app/feature/category/cate_personal/expense/cate_expense_personal_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'income/bloc/cate_income_personal_bloc.dart';
import 'income/cate_income_personal_management.dart';

class CatePersonalTab extends StatelessWidget {
  const CatePersonalTab({super.key});
  static String routeName = 'cate_personal';

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
              create: (context) => CateExpensePersonalBloc(),
              child: const CateExpensePersonalManagement(),
            ),
            BlocProvider(
              create: (context) => CateIncomePersonalBloc(),
              child: const CateIncomePersonalManagement(),
            ),
          ],
        ),
        bottomSheet: const BottomSheetButton(),
      ),
    );
  }
}
