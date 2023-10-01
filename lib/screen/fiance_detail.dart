// ignore_for_file: prefer_const_constructors

import 'package:finance_app/component/list_history_home.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/screen/fix_detail.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class FianceDetail extends StatefulWidget {
  const FianceDetail({super.key});

  static String routeName = '/fiance_detail';

  @override
  State<FianceDetail> createState() => _FianceDetailState();
}

class _FianceDetailState extends State<FianceDetail> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('Danh sách thu chi', style: H5()),
      ),
      body: Column(
        children: [
          //lịch
          TableCalendar(
            rowHeight: 40,
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
                color: white, border: Border.all(width: 1, color: grey)
                // boxShadow: [
                //   BoxShadow(
                //     color: lightGrey,
                //     blurRadius: 10,
                //     spreadRadius: 0.5,
                //     offset: Offset(0, 15),
                //   ),
                // ],
                // // boxShadow: kElevationToShadow[2],
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(16),
                //   bottomRight: Radius.circular(16),
                // ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Thu nhập', style: medium()),
                    Text('10.000.000 đ', style: gMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Chi tiêu', style: medium()),
                    Text('5.000.000 đ', style: rMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Còn', style: medium()),
                    Text('5.000.000 đ', style: bMediumBold()),
                  ],
                ),
              ],
            ),
          ),

          //list
          Container(
            padding: EdgeInsets.all(16),
            height: 300,
            color: white,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('20/09/2023', style: mediumBold()),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: lightYellow,
                            border: Border.all(width: 1, color: grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text('Ăn uống', style: mediumBold()),
                              Text(' (Đi chợ)', style: mediumRegular()),
                            ]),
                            Text(
                              '300.000 đ',
                              style: mediumBold(),
                            ),
                            Icon(
                              Icons.delete,
                              color: red,
                              size: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                  // return ListHistoryHome(
                  //   note: finances[index].note,
                  //   cost: finances[index].cost,
                  //   cate: finances[index].cate,
                  //   date: finances[index].date,
                  // );
                }),
          ),
        ],
      ),
    );
  }
}
