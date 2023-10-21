// ignore_for_file: import_of_legacy_library_into_null_safe, sort_child_properties_last, prefer_const_constructors

import 'package:finance_app/screen/settings.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/screen/fiance_detail.dart';
import 'package:finance_app/screen/home.dart';
import 'package:finance_app/screen/write_finance.dart';
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
      FianceDetail(),
      HomeScreen(),
      Settings(),
    ];
    return Scaffold(
      body: tabs[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: white,
        currentIndex: _pageIndex,
        selectedLabelStyle: medium(),
        unselectedLabelStyle: medium(),
        selectedItemColor: themeColor,
        unselectedItemColor: grey,
        iconSize: 24,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.note_add),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.calendar_month),
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.person),
            ),
            label: 'Analys',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Icon(Icons.settings),
            ),
            label: 'Settings',
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
