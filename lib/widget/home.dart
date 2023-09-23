import 'package:finance_app/component/boxDetailBasic.dart';
import 'package:finance_app/widget/fianceDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                height: 200,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/avatar.jpg',
                              width: 60, height: 60),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào buổi sáng!',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'NGUYEN MANH CUONG',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: grey,
                        offset: Offset(0.0, 5.0),
                        blurRadius: 20.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    color: white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Tổng số tiền: 10.000.000',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Thu: 10.000.000',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: green,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Chi: 5.000.000',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: grey,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Danh sách thu chi gần đây',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FianceDetail.routeName);
                        },
                        child: Text(
                          'Tất cả',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      DetailBoxBasic(),
                      SizedBox(height: 10),
                      DetailBoxBasic(),
                      SizedBox(height: 10),
                      DetailBoxBasic(),
                      SizedBox(height: 10),
                      DetailBoxBasic(),
                      SizedBox(height: 10),
                      DetailBoxBasic(),
                      SizedBox(height: 10),
                      DetailBoxBasic(),
                      SizedBox(height: 10),
                      DetailBoxBasic(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
