// ignore_for_file: import_of_legacy_library_into_null_safe, sort_child_properties_last, prefer_const_constructors

import 'package:finance_app/feature/setting/settings.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/feature/fiance_detail.dart';
import 'package:finance_app/feature/home.dart';
import 'package:finance_app/feature/finances/finance_navigator.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  static String routeName = "/bottom";

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeScreen(),
      IncomeAndExpense(),
      FinanceDetail(),
      HomeScreen(),
      Settings(),
    ];
    return Scaffold(
      body: tabs[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        currentIndex: _pageIndex,
        selectedLabelStyle: tStyle.medium(),
        unselectedLabelStyle: tStyle.medium(),
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: AppColors.grey,
        iconSize: 24,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.home),
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.note_add),
            ),
            label: 'Thêm',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.calendar_month),
            ),
            label: 'Lịch biểu',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.person),
            ),
            label: 'Thống kê',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.settings),
            ),
            label: 'Cài đặt',
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
