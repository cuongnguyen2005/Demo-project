// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:finance_app/component/input_default.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  void _showDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2300),
    );
    if (picked != null) {
      setState(() {
        dateTime = picked;
      });
    }
  }

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          Container(
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
                        InkWell(
                          onTap: _showDatePicker,
                          child: Container(
                            width: size.width - size.width * 1 / 7 - 32,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: lightYellow,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                DateFormat.yMMMMEEEEd().format(dateTime),
                                style: medium(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
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
                          child: InputDefault(
                            hintText: 'Nhập số tiền',
                            keyboardType: TextInputType.number,
                          ),
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
                  height: 180,
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: red,
                        child: Text('1'),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: red,
                        child: Text('1'),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: red,
                        child: Text('1'),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: red,
                        child: Text('1'),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: red,
                        child: Text('1'),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
        ],
      ),
    );
  }
}
