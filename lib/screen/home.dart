// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:finance_app/component/list_history_home.dart';
import 'package:finance_app/component/search.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/screen/fiance_detail.dart';
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
    var size = MediaQuery.of(context).size; //custom chiều rộng của grid
    return Scaffold(
      backgroundColor: themeColor,
      body: ListView(
        children: [
          Column(
            children: [
              //search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Search(
                  hintText: 'Tìm kiếm',
                ),
              ),

              //head
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Xin chào!', style: H6()),
                        SizedBox(height: 5),
                        Text('Nguyễn Mạnh Cường', style: H3()),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 33),

              //total money
              Column(
                children: [
                  Text('Tổng tài sản', style: H2()),
                  SizedBox(height: 5),
                  Text('10.000.000 đ', style: H1()),
                ],
              ),

              //finance info basic
              Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 2 / 3,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: lightGreen,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home,
                                size: 26,
                                color: white,
                              ),
                              Text('10.000.000 đ', style: H4()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width * 2 / 3,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: lightRed,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('10.000.000 đ', style: H4()),
                              Icon(
                                Icons.home,
                                size: 26,
                                color: white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 16,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lịch sử gần đây',
                      style: H5(),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Tất cả',
                        style: BlueH5(),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                constraints: BoxConstraints(minHeight: size.height * .4),
                color: white,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: finances.length,
                    itemBuilder: (context, index) {
                      return ListHistoryHome(
                        note: finances[index].note,
                        cost: finances[index].cost,
                        cate: finances[index].cate,
                        date: finances[index].date,
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onTapListFiance() {
    Navigator.pushNamed(context, FianceDetail.routeName);
  }
}
