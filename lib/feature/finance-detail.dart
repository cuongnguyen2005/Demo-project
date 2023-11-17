// ignore_for_file: file_names

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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    groupFinanceByDay();
  }

  User? user = FirebaseAuth.instance.currentUser;
  String? key;

  List<Finance> listByMonth = [];
  void groupFinanceByDay() async {
    List<Finance> list = await FinanceRepo.getFinances(user!.uid);
    List<Finance> financeList = [];
    setState(() {
      financeList = list;
    });

    //sort finance by date
    financeList.sort((b, a) => a.dateTime.compareTo(b.dateTime));

    //show list by month
    listByMonth = [];
    for (var element in financeList) {
      if (DateTime.parse(element.dateTime).month == today.month &&
          DateTime.parse(element.dateTime).year == today.year) {
        setState(() {
          listByMonth.add(element);
        });
      }
    }
  }

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text(AppLocalizations.of(context)!.listInAndEx,
              style: tStyle.H5()),
        ),
      ),
      body: Column(
        children: [
          //lịch
          TableCalendar(
            startingDayOfWeek: StartingDayOfWeek.monday,
            // locale: 'vi_VN',
            rowHeight: 35,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            focusedDay: today,
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2050),
            onPageChanged: (focusedDay) {
              setState(() {
                today = focusedDay;
                groupFinanceByDay();
              });
            },
          ),
          Container(width: double.infinity, height: 1, color: AppColors.grey),

          //list
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: listByMonth.length,
                itemBuilder: (context, index) {
                  DateTime dateTimeFormat =
                      DateTime.parse(listByMonth[index].dateTime);
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) =>
                              onTapDelete(listByMonth[index].id),
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
                            listByMonth[index].cateID == 2
                                ? onTapUpdateExpense(
                                    listByMonth[index], listByMonth[index].id)
                                : onTapUpdateIncome(
                                    listByMonth[index], listByMonth[index].id);
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
                                          Text(listByMonth[index].cateName,
                                              style: tStyle.mediumBold()),
                                          Text(
                                            ' (${listByMonth[index].note})',
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
                                      listByMonth[index].cateID == 2
                                          ? '- ${NumberFormat.decimalPattern().format(listByMonth[index].money)} đ'
                                          : '+ ${NumberFormat.decimalPattern().format(listByMonth[index].money)} đ',
                                      style: listByMonth[index].cateID == 2
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

  void onTapUpdateExpense(finances, String id) {
    Navigator.pushNamed(context, ExpensePage.routeName,
        arguments: ExpensePageArg(isUpdate: true, finances: finances, key: id));
  }

  void onTapUpdateIncome(finances, String id) {
    Navigator.pushNamed(context, IncomePage.routeName,
        arguments: IncomePageArg(isUpdate: true, finances: finances, key: id));
  }

  void onTapDelete(key) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogPrimary(
          content: 'Bạn có thực sự muốn xóa không?',
          onTap: () async {
            await FirebaseDatabase.instance
                .ref()
                .child('finance')
                .child(user!.uid)
                .child(key)
                .remove();
            onTapBack();
            setState(() {
              groupFinanceByDay();
            });
          },
        );
      },
    );
  }
}
