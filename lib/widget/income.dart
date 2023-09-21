import 'package:finance_app/colors.dart';
import 'package:finance_app/component/buttonPrimary.dart';
import 'package:finance_app/component/textBox.dart';
import 'package:flutter/material.dart';

import '../component/boxDetail.dart';

class Income extends StatelessWidget {
  const Income({super.key});

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
              title: 'Tổng thu nhập trong tháng',
              content: '10.000.000',
              color: maincolor,
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
                      labelText: 'Chọn danh mục',
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
                    height: 15,
                  ),
                  ButtonPrimary(textButton: 'Nhập khoản thu')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //List hiển thị danh sách thu
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    'Danh sách khoản thu',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: Column(
                      // shrinkWrap: true,
                      children: <Widget>[
                        DetailBox(),
                        SizedBox(height: 5),
                        DetailBox(),
                        SizedBox(height: 5),
                        DetailBox(),
                        SizedBox(height: 5),
                        DetailBox(),
                        SizedBox(height: 5),
                        DetailBox(),
                        SizedBox(height: 5),
                        DetailBox(),
                        SizedBox(height: 5),
                        DetailBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
