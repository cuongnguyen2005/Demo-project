import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:finance_app/feature/category/cate_personal/cate_personal_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CatePersonalTab extends StatelessWidget {
  const CatePersonalTab({super.key});
  static String routeName = 'cate_personal';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBarDefault(
            text1: AppLocalizations.of(context)!.expense,
            text2: AppLocalizations.of(context)!.income),
        body: const TabBarView(
          children: [
            CatePersonalManagement(isCateExpense: true),
            CatePersonalManagement(isCateExpense: false),
          ],
        ),
        bottomSheet: const BottomSheetButton(),
      ),
    );
  }
}
