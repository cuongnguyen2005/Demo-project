// ignore_for_file: prefer_const_constructors

import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class FinanceDetail extends StatefulWidget {
  const FinanceDetail({super.key});

  static String routeName = '/fiance_detail';

  @override
  State<FinanceDetail> createState() => _FinanceDetailState();
}

class _FinanceDetailState extends State<FinanceDetail> {
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  User? user = FirebaseAuth.instance.currentUser;
  Query? dbRef;
  void getInfo() {
    if (user != null) {
      dbRef = FirebaseDatabase.instance.ref().child('finance').child(user!.uid);
    }
  }

  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text('Danh sách thu chi', style: tStyle.H5()),
        ),
      ),
      body: Column(
        children: [
          //lịch
          TableCalendar(
            rowHeight: 35,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            focusedDay: today,
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2050),
          ),

          //tổng quan tiền
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(width: 1, color: AppColors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Thu nhập', style: tStyle.medium()),
                    Text('10.000.000 đ', style: tStyle.gMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Chi tiêu', style: tStyle.medium()),
                    Text('5.000.000 đ', style: tStyle.rMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Còn', style: tStyle.medium()),
                    Text('5.000.000 đ', style: tStyle.bMediumBold()),
                  ],
                ),
              ],
            ),
          ),

          //list
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FirebaseAnimatedList(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                query: dbRef!,
                itemBuilder: (context, snapshot, animation, index) {
                  Finance finances = Finance.fromMap(snapshot.value);
                  DateTime dateTimeFormat = DateTime.parse(finances.dateTime);
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(DateFormat.yMd().format(dateTimeFormat),
                                style: tStyle.mediumBold()),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.lightYellow,
                            border:
                                Border.all(width: 1, color: AppColors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text(finances.cateName,
                                  style: tStyle.mediumBold()),
                              Text(' (${finances.note})',
                                  style: tStyle.mediumRegular()),
                            ]),
                            Text(
                              '${NumberFormat.decimalPattern().format(finances.money)} đ',
                              style: finances.cateID == 2
                                  ? tStyle.rMediumBold()
                                  : tStyle.gMediumBold(),
                            ),
                            Icon(
                              Icons.delete,
                              color: AppColors.red,
                              size: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
