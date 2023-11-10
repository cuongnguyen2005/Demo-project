// ignore_for_file: prefer_const_constructors

import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/feature/finances/expense.dart';
import 'package:finance_app/feature/finances/income.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class FinanceDetail extends StatefulWidget {
  const FinanceDetail({super.key});

  static String routeName = '/fiance_detail';

  @override
  State<FinanceDetail> createState() => _FinanceDetailState();
}

class _FinanceDetailState extends State<FinanceDetail> {
  @override
  void initState() {
    super.initState();
    if (user != null) {
      dbRef = FirebaseDatabase.instance.ref().child('finance').child(user!.uid);
    }
  }

  User? user = FirebaseAuth.instance.currentUser;
  Query? dbRef;

  DateTime today = DateTime.now();

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
            locale: 'vi_VN',
            rowHeight: 35,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            focusedDay: today,
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2050),
          ),

          //tổng quan tiền
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(width: 1, color: AppColors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Thu nhập', style: tStyle.medium()),
                    Text('10.000.000 đ', style: tStyle.gMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Chi tiêu', style: tStyle.medium()),
                    Text('5.000.000 đ', style: tStyle.rMediumBold()),
                  ],
                ),
                Column(
                  children: [
                    Text('Còn', style: tStyle.medium()),
                    Text('5.000.000 đ', style: tStyle.bMediumBold()),
                  ],
                ),
              ],
            ),
          ),

          //list
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FirebaseAnimatedList(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                query: dbRef!,
                itemBuilder: (context, snapshot, animation, index) {
                  Finance finances = Finance.fromMap(snapshot.value);
                  DateTime dateTimeFormat = DateTime.parse(finances.dateTime);
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) =>
                              onTapDelete(snapshot, finances.cateName),
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
                            finances.cateID == 2
                                ? onTapUpdateExpense(finances, snapshot)
                                : onTapUpdateIncome(finances, snapshot);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
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
                                          Text(finances.cateName,
                                              style: tStyle.mediumBold()),
                                          Text(
                                            ' (${finances.note})',
                                            style: tStyle.small(),
                                            overflow: TextOverflow.clip,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
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
                                      finances.cateID == 2
                                          ? '- ${NumberFormat.decimalPattern().format(finances.money)} đ'
                                          : '+ ${NumberFormat.decimalPattern().format(finances.money)} đ',
                                      style: finances.cateID == 2
                                          ? tStyle.rMediumBold()
                                          : tStyle.gMediumBold(),
                                    ),
                                    Icon(
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
