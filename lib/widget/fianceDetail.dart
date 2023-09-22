import 'package:finance_app/colors.dart';
import 'package:finance_app/component/boxDetail.dart';
import 'package:finance_app/main.dart';
import 'package:flutter/material.dart';

class FianceDetail extends StatelessWidget {
  const FianceDetail({super.key});

  static String routeName = '/fiance_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Center(
          child: Text(
            'Danh sách chi tiêu thu chi',
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
            SizedBox(height: 20),
            DetailBox(),
            SizedBox(height: 10),
            DetailBox(),
            SizedBox(height: 10),
            DetailBox(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
