// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: import_of_legacy_library_into_null_safe, sort_child_properties_last, prefer_const_constructors

import 'package:finance_app/feature/statistical.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/feature/finance-dt.dart';
import 'package:finance_app/feature/finance_detail.dart';
import 'package:finance_app/feature/finances/finance_navigator.dart';
import 'package:finance_app/feature/home.dart';
import 'package:finance_app/feature/setting/settings.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      // HomeScreen(),
      IncomeAndExpense(),
      // FinanceDt(),
      FinanceDetail(),
      StatisticalPage(),
      Settings(),
    ];
    return Scaffold(
      body: tabs[_pageIndex],
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 10,
            bottom: 16,
          ),
          child: GNav(
            selectedIndex: _pageIndex,
            padding: EdgeInsets.all(10),
            backgroundColor: AppColors.white,
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.themeColor,
            color: AppColors.grey,
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.note_add,
                text: 'Thêm',
              ),
              GButton(
                icon: Icons.calendar_month,
                text: 'Lịch biểu',
              ),
              GButton(
                icon: Icons.insert_chart_rounded,
                text: 'Thống kê',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Cài đặt',
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
