import 'package:finance_app/feature/finances/bloc/finances_bloc.dart';
import 'package:finance_app/feature/setting/settings.dart';
import 'package:finance_app/feature/statis/statis_tab.dart';
import 'package:finance_app/feature/finance_detail/bloc/finance_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/feature/finance_detail/finance_detail.dart';
import 'package:finance_app/feature/finances/finance_tab.dart';
import 'package:finance_app/source/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'statis/bloc/statis_bloc.dart';

class Bottom extends StatefulWidget {
  const Bottom({
    Key? key,
    this.isUpdate,
  }) : super(key: key);
  final bool? isUpdate;

  static String routeName = "/bottom";

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  void initState() {
    super.initState();
    widget.isUpdate == true ? _pageIndex = 1 : _pageIndex = 0;
  }

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      BlocProvider(
        create: (context) => FinancesBloc(),
        child: const FinanceTabbar(),
      ),
      BlocProvider(
        create: (context) => FinanceDetailBloc(),
        child: const FinanceDetail(),
      ),
      BlocProvider(
        create: (context) => StatisBloc(),
        child: const StatisTab(),
      ),
      const Settings(),
    ];
    return Scaffold(
      body: tabs[_pageIndex],
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 10,
            bottom: 16,
          ),
          child: GNav(
            selectedIndex: _pageIndex,
            padding: const EdgeInsets.all(10),
            backgroundColor: AppColors.white,
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.themeColor,
            color: AppColors.grey,
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.note_add,
                text: AppLocalizations.of(context)!.navi1,
              ),
              GButton(
                icon: Icons.calendar_month,
                text: AppLocalizations.of(context)!.navi2,
              ),
              GButton(
                icon: Icons.insert_chart_rounded,
                text: AppLocalizations.of(context)!.navi3,
              ),
              GButton(
                icon: Icons.settings,
                text: AppLocalizations.of(context)!.navi4,
              ),
            ],
            onTabChange: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
