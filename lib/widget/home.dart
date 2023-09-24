// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:finance_app/component/card_grid.dart';
import 'package:finance_app/component/search.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/widget/fiance_detail.dart';
import 'package:flutter/material.dart';
import '../source/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height * .20; //custom chiều cao cảu grid
    final double itemWidth = size.width / 2; //custom chiều rộng của grid
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Image(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: ListView(children: [
        Stack(
          children: [
            //header
            Container(
              height: size.height * .35,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.3),
                    spreadRadius: 3, //độ mờ shadow
                    blurRadius: 5, //tán shadow
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  //tìm kiếm
                  Search(),
                  SizedBox(height: 16),

                  //head
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: white,
                            context: context,
                            builder: (context) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 30,
                              ),
                              height: 150,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          child: Icon(Icons.person),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Đổi hình nền',
                                          style: TextBlack16B(),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundColor: red,
                                          child: Icon(
                                            Icons.exit_to_app,
                                            color: white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Thoát',
                                          style: TextDynamic16B(color: red),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào buổi sáng!',
                            style: Text16(),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'NGUYEN MANH CUONG',
                            style: Healing20B(),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            // card và grid view
            Column(
              children: [
                //card chứa thông tin
                Container(
                  margin: EdgeInsets.only(top: 210, left: 16, right: 16),
                  padding: EdgeInsets.all(16),
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.3),
                        spreadRadius: 2, //độ mờ shadow
                        blurRadius: 10, //tán shadow
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: grey.shade200,
                          ),
                        )),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Tổng tài sản",
                              style: TextBlack16B(),
                            ),
                            Text(
                              "10.000.000 VNĐ",
                              style: Healing20B(),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: green,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '10.000.000 VNĐ',
                                style: Text16(color: green),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: red,
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '5.000.000 VNĐ',
                                style: Text16(color: red),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),

                //Grid view
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      CardGrid(
                        iconData: Icons.article_rounded,
                        gridColor1: maincolor,
                        gridColor2: yellow1,
                        text: 'Danh sách thu chi',
                        onTap: onTapListFiance,
                      ),
                      CardGrid(
                        iconData: Icons.category_rounded,
                        gridColor1: yellow3,
                        gridColor2: yellow2,
                        text: 'Danh mục',
                      ),
                      CardGrid(
                        iconData: Icons.settings,
                        gridColor1: yellow1,
                        gridColor2: yellow3,
                        text: 'Cài đặt',
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }

  void onTapListFiance() {
    Navigator.pushNamed(context, FianceDetail.routeName);
  }
}
