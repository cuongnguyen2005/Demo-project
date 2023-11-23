import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'cate_default_management.dart';

class CateDefaultTab extends StatelessWidget {
  const CateDefaultTab({super.key});
  static String routeName = 'cate_default';

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
            CateDefaultManagement(isExpenseCate: true),
            CateDefaultManagement(isExpenseCate: false),
          ],
        ),
        bottomSheet: const BottomSheetButton(),
      ),
    );
  }
}
