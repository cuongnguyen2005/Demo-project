import 'package:finance_app/component/textBox.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: white,
        title: Text(
          "Quản lý tài chính",
          style: TextStyle(color: black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    TextBox(
                      title: 'Tổng thu nhập',
                      content: '10.000.000',
                      color: maincolor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextBox(
                      title: 'Tổng chi tiêu',
                      content: '5.000.000',
                      color: red,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextBox(
                      title: 'Còn lại',
                      content: '5.000.000',
                      color: green,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
