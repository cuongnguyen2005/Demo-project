import 'package:finance_app/source/colors.dart';
import 'package:flutter/material.dart';

class FixDetail extends StatelessWidget {
  const FixDetail({super.key, required this.financeModel});
  final String financeModel;

  static String routeName = "/fix_detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              financeModel,
              style: TextStyle(fontSize: 20, color: black),
            ),
          ],
        ),
      ),
    );
  }
}
