// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/feature/finances/expense.dart';
import 'package:finance_app/feature/finances/income.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class FinanceDt extends StatefulWidget {
  const FinanceDt({super.key});

  static String routeName = '/fiance_detail';

  @override
  State<FinanceDt> createState() => _FinanceDtState();
}

class _FinanceDtState extends State<FinanceDt> {
  @override
  void initState() {
    super.initState();
    getKey();
    getInfo();
  }

  User? user = FirebaseAuth.instance.currentUser;
  String? key;

  List<Finance> financeList = [];

  void getInfo() async {
    List<Finance> list = await FinanceRepo.getFinances(user!.uid);
    setState(() {
      financeList.addAll(list);
    });
    for (var element in financeList) {
      if (element.cateID == 2) {
        totalExpense += element.money;
      }
      if (element.cateID == 1) {
        totalIncome += element.money;
      }
    }
    finalTotal = totalIncome - totalExpense;
  }

  void getKey() {
    var ref = FirebaseDatabase.instance
        .ref()
        .child('finance')
        .child(user!.uid)
        .get()
        .then((value) {
      print(value.value);
      return value.key;
    });
  }

  int totalExpense = 0;
  int totalIncome = 0;
  int finalTotal = 0;

  DateTime today = DateTime.now();
  String monthCur = DateTime.now().month.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text('Danh sách thu chi', style: tStyle.H5()),
        ),
      ),
      body: Column(
        children: [
          //lịch
          TableCalendar(
            startingDayOfWeek: StartingDayOfWeek.monday,
            locale: 'vi_VN',
            rowHeight: 35,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            focusedDay: today,
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2050),
          ),

          //tổng quan tiền
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(width: 1, color: AppColors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Thu nhập', style: tStyle.medium()),
                    Text(
                        '${NumberFormat.decimalPattern().format(totalIncome)} đ',
                        style: tStyle.gMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Chi tiêu', style: tStyle.medium()),
                    Text(
                        '${NumberFormat.decimalPattern().format(totalExpense)} đ',
                        style: tStyle.rMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Còn', style: tStyle.medium()),
                    Text(
                        '${NumberFormat.decimalPattern().format(finalTotal)} đ',
                        style: tStyle.bMediumBold()),
                  ],
                ),
              ],
            ),
          ),

          //list
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: financeList.length,
                itemBuilder: (context, index) {
                  DateTime dateTimeFormat =
                      DateTime.parse(financeList[index].dateTime);
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            financeList.removeAt(index);
                          },
                          // (context) =>
                          //     onTapDelete(snapshot, finances.cateName),
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // financeList[index].cateID == 2
                            //     ? onTapUpdateExpense(finances, snapshot)
                            //     : onTapUpdateIncome(finances, snapshot);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: AppColors.grey))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(financeList[index].cateName,
                                              style: tStyle.mediumBold()),
                                          Text(
                                            ' (${financeList[index].note})',
                                            style: tStyle.small(),
                                            overflow: TextOverflow.clip,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                              DateFormat.yMd()
                                                  .format(dateTimeFormat),
                                              style: tStyle.mediumBold()),
                                          Text(
                                              ' (${DateFormat.E('vi').format(dateTimeFormat)})',
                                              style: tStyle.mediumBold()),
                                        ],
                                      ),
                                    ]),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      financeList[index].cateID == 2
                                          ? '- ${NumberFormat.decimalPattern().format(financeList[index].money)} đ'
                                          : '+ ${NumberFormat.decimalPattern().format(financeList[index].money)} đ',
                                      style: financeList[index].cateID == 2
                                          ? tStyle.rMediumBold()
                                          : tStyle.gMediumBold(),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.of(context).pop();
  }

  void onTapUpdateExpense(finances, DataSnapshot snapshot) {
    Navigator.pushNamed(context, ExpensePage.routeName,
        arguments: ExpensePageArg(
            isUpdate: true, finances: finances, key: snapshot.key));
  }

  void onTapUpdateIncome(finances, DataSnapshot snapshot) {
    Navigator.pushNamed(context, IncomePage.routeName,
        arguments: IncomePageArg(
            isUpdate: true, finances: finances, key: snapshot.key));
  }

  void onTapDelete(snapshot, cateName) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogPrimary(
          content: 'Bạn có muốn xóa $cateName không?',
          onTap: () async {
            await FirebaseDatabase.instance
                .ref()
                .child('finance')
                .child(user!.uid)
                .child(snapshot.key!)
                .remove();
            onTapBack();
          },
        );
      },
    );
  }
}
