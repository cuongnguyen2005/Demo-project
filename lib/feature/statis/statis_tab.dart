import 'package:finance_app/component/tab_bar/tab_bar.dart';
import 'package:finance_app/feature/statis/month_statistical.dart';
import 'package:finance_app/feature/statis/year_statistical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisTab extends StatelessWidget {
  const StatisTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBarDefault(
            text1: AppLocalizations.of(context)!.month,
            text2: AppLocalizations.of(context)!.year),
        body: const TabBarView(
          children: [
            MonthStatisticalPage(),
            YearStatisticalPage(),
          ],
        ),
      ),
    );
  }
}
