// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
//Box hiển thị số tiền và nội dung của box

import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class ListHistoryHome extends StatelessWidget {
  const ListHistoryHome({
    super.key,
    required this.note,
    required this.cost,
    required this.cate,
    required this.date,
  });

  final String note;
  final String cost;
  final String date;
  final bool cate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note, style: mediumBold()),
              SizedBox(height: 5),
              Text(date, style: small()),
            ],
          ),
          Text(
            cost + 'đ',
            style: cate == false ? rMediumBold() : gMediumBold(),
          ),
        ],
      ),
    );
  }
}
