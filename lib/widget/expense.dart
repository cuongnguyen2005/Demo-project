import 'package:finance_app/colors.dart';
import 'package:finance_app/component/buttonPrimary.dart';
import 'package:finance_app/component/textBox.dart';
import 'package:flutter/material.dart';

import '../component/boxDetail.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 16,
            ),

            //textbox hiển thị số tiền
            TextBox(
              title: 'Tổng chi tiêu trong tháng',
              content: '5.000.000',
              color: red,
            ),
            SizedBox(
              height: 16,
            ),

            //container nhập số tiền thu nhập
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Danh mục',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              GridView.count(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ButtonPrimary(textButton: 'Nhập khoản chi')
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
