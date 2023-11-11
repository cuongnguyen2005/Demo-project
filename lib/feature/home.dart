// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/data/user_account.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/feature/finance_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../source/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
    getInfo();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UsersAccount? usersAccount;
  void getUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      setState(() {
        usersAccount = UsersAccount.fromMap(value.data());
      });
    });
  }

  List<Finance> financeList = [];
  int totalExpense = 0;
  int totalIncome = 0;
  int finalTotal = 0;

  void getInfo() async {
    List<Finance> getList = await getFinance();
    setState(() {
      financeList = getList;
    });
    for (var element in financeList) {
      if (element.cateID == 2) {
        totalExpense += element.money;
      }
      // print(element.money);

    }
    print(totalExpense);
  }

  Future<List<Finance>> getFinance() async {
    await FirebaseDatabase.instance
        .ref()
        .child('finance/${user!.uid}')
        .get()
        .then(
      (snap) {
        var map =
            Map<Object?, dynamic>.from(snap.value as Map<Object?, dynamic>);
        map.forEach(
          (key, value) {
            Finance? finance;
            finance = Finance.fromMap(value);
            financeList.add(finance);
          },
        );
      },
    );
    return financeList;
  }

  @override
  Widget build(BuildContext context) {
    for (var element in financeList) {
      if (element.cateID == 2) {
        totalExpense += element.money;
      }
      if (element.cateID == 1) {
        totalIncome += element.money;
      }
    }
    finalTotal = totalIncome - totalExpense;
    var size = MediaQuery.of(context).size;
    final String avat = usersAccount?.avatar ?? '';
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: SafeArea(
        child: Column(
          children: [
            //header
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: avat.isEmpty
                        ? null
                        : MemoryImage(
                            base64.decode(usersAccount?.avatar ?? '')),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Xin chào!', style: tStyle.H6()),
                      SizedBox(height: 5),
                      Text(usersAccount?.name ?? "", style: tStyle.H3()),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),

            //total money
            Column(
              children: [
                Text('Tổng tài sản', style: tStyle.H2()),
                SizedBox(height: 5),
                Text('${NumberFormat.decimalPattern().format(finalTotal)} đ',
                    style: tStyle.H1()),
              ],
            ),

            //finance info basic
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 16),
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
                            color: AppColors.lightGreen,
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
                              color: AppColors.white,
                            ),
                            Text(
                                '${NumberFormat.decimalPattern().format(totalIncome)} đ',
                                style: tStyle.H4()),
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
                            color: AppColors.lightRed,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${NumberFormat.decimalPattern().format(totalExpense)} đ',
                                style: tStyle.H4()),
                            Icon(
                              Icons.home,
                              size: 26,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Flexible(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lịch sử gần đây',
                          style: tStyle.H5(),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Tất cả',
                            style: tStyle.H5Blue(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Flexible(
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: finances.length,
                    //     itemBuilder: (context, index) {
                    //       return ListHistoryHome(
                    //         note: finances[index].note,
                    //         cost: finances[index].cost,
                    //         cate: finances[index].cate,
                    //         date: finances[index].date,
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapListFiance() {
    Navigator.pushNamed(context, FinanceDetail.routeName);
  }
}
