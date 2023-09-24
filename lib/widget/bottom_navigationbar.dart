// ignore_for_file: import_of_legacy_library_into_null_safe, sort_child_properties_last, prefer_const_constructors

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:finance_app/colors.dart';
import 'package:finance_app/widget/fiance_detail.dart';
import 'package:finance_app/widget/home.dart';
import 'package:finance_app/widget/write_finance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  static String routeName = "/bottom";

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: getTabs(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = 4;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: maincolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getTabs() {
    List<IconData> iconsItems = [
      MaterialCommunityIcons.home_variant,
      MaterialCommunityIcons.note_text,
      MaterialCommunityIcons.chart_areaspline,
      MaterialCommunityIcons.account_circle,
    ];
    return AnimatedBottomNavigationBar(
      icons: iconsItems,
      activeColor: maincolor,
      inactiveColor: grey,
      gapLocation: GapLocation.center,
      splashColor: maincolor,
      activeIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomeScreen(),
        FianceDetail(),
        HomeScreen(),
        HomeScreen(),
        IncomeAndExpense(),
      ],
    );
  }
}
