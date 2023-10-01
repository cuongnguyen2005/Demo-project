// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:finance_app/component/input_default.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/button_primary.dart';
import 'package:finance_app/component/list_history_home.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // textbox nhập nội dung
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width * 1 / 7,
                      child: Text('Ngày', style: medium()),
                    ),
                    Container(
                      width: size.width - size.width * 1 / 7 - 32,
                      child: InputDefault(hintText: 'Nhập ngày'),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: size.width * 1 / 7,
                      child: Text('Ghi chú', style: medium()),
                    ),
                    Container(
                      width: size.width - size.width * 1 / 7 - 32,
                      child: InputDefault(hintText: 'Nhập ghi chú'),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: size.width * 1 / 7,
                      child: Text('Số Tiền', style: medium()),
                    ),
                    Container(
                      width: size.width - size.width * 1 / 7 - 32,
                      child: InputDefault(hintText: 'Nhập số tiền'),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            //lựa chọn danh mục
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Danh mục', style: medium()),
              ],
            ),
            SizedBox(height: 16),

            Container(
              color: green,
              height: 180,
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: red,
                    child: Text('1'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: red,
                    child: Text('1'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: red,
                    child: Text('1'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: red,
                    child: Text('1'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: red,
                    child: Text('1'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: red,
                    child: Text('1'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            //button
            Align(
                alignment: Alignment.bottomCenter,
                child: ButtonPrimary(textButton: 'Nhập khoản thu'))
          ],
        ),
      ),
    );
  }
}
