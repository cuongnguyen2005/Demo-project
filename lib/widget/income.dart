// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/button_primary.dart';
import 'package:finance_app/component/text_box.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 16),
          //textbox hiển thị số tiền
          TextBox(
            title: 'Tổng thu nhập trong tháng',
            content: '10.000.000',
            color: maincolor,
          ),
          SizedBox(height: 16),

          //container nhập số tiền thu nhập
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                TextFormField(
                  style: Text14(),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    labelText: 'Nhập ngày',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: maincolor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: Text14(),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    labelText: 'Nhập số tiền',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: maincolor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: Text14(),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    labelText: 'Nhập ghi chú',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: maincolor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Danh mục',
                        style: Text16(),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 180,
                        child: GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 4,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              color: red,
                              child: Text('1'),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: red,
                              child: Text('2'),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: red,
                              child: Text('3'),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: red,
                              child: Text('1'),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: red,
                              child: Text('2'),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: red,
                              child: Text('3'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ButtonPrimary(textButton: 'Nhập khoản thu')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
