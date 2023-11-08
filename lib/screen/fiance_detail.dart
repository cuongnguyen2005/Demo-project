// ignore_for_file: prefer_const_constructors

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
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
                            Text('20/09/2023', style: tStyle.mediumBold()),
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
                              Text('Ăn uống', style: tStyle.mediumBold()),
                              Text(' (Đi chợ)', style: tStyle.mediumRegular()),
                            ]),
                            Text(
                              '300.000 đ',
                              style: tStyle.mediumBold(),
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
