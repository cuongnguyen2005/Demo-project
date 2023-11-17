// ignore_for_file: file_names

import 'package:collection/collection.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pie_chart/pie_chart.dart';

class YearStatisticalPage extends StatefulWidget {
  const YearStatisticalPage({super.key});

  @override
  State<YearStatisticalPage> createState() => _YearStatisticalPageState();
}

class _YearStatisticalPageState extends State<YearStatisticalPage> {
  Map<String, double> dataMap = {
    'Ăn uống': 1,
  };
  @override
  void initState() {
    super.initState();
    groupFinanceByCatename();
    groupFinanceByDay();
  }

  List<String> nameCateList = [];
  User? user = FirebaseAuth.instance.currentUser;

  void groupFinanceByCatename() async {
    List<Finance> listByYear = [];
    nameCateList = [];
    List<Finance> list = await FinanceRepo.getFinances(user!.uid);
    for (var element in list) {
      if (DateTime.parse(element.dateTime).year == today.year) {
        listByYear.add(element);
      }
    }
    final groups = groupBy(listByYear, (Finance e) {
      return e.cateName;
    });
    groups.forEach((key, value) {
      setState(() {
        nameCateList.add(key);
      });
    });
  }

  List<Finance> listByMonth = [];
  void groupFinanceByDay() async {
    List<Finance> list = await FinanceRepo.getFinances(user!.uid);
    List<Finance> financeList = [];
    setState(() {
      financeList = list;
    });

    //show list by month
    listByMonth = [];
    for (var element in financeList) {
      if (DateTime.parse(element.dateTime).year == today.year) {
        setState(() {
          listByMonth.add(element);
        });
      }
    }

    //caculator
    totalExpense = 0;
    totalIncome = 0;
    for (var element in listByMonth) {
      if (element.cateID == 2) {
        totalExpense += element.money;
      }
      if (element.cateID == 1) {
        totalIncome += element.money;
      }
    }
    finalTotal = totalIncome - totalExpense;
  }

  int totalExpense = 0;
  int totalIncome = 0;
  int finalTotal = 0;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              final selected = await showMonthYearPicker(
                context: context,
                initialMonthYearPickerMode: MonthYearPickerMode.year,
                initialDate: today,
                firstDate: DateTime(2010),
                lastDate: DateTime(2050),
              );
              if (selected != null) {
                setState(() {
                  today = selected;
                  groupFinanceByDay();
                  groupFinanceByCatename();
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
              decoration: BoxDecoration(
                color: AppColors.lightYellow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                  child: Text(
                DateFormat.y().format(today),
                style: tStyle.medium(),
              )),
            ),
          ),
          // PieChart(
          //   dataMap: dataMap,
          //   chartValuesOptions: const ChartValuesOptions(
          //     showChartValuesInPercentage: true,
          //   ),
          // ),

          //tổng quan tiền
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(width: 1, color: AppColors.grey)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.income,
                        style: tStyle.medium()),
                    Text(
                        '${NumberFormat.decimalPattern().format(totalIncome)} đ',
                        style: tStyle.gMediumBold()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.expense,
                        style: tStyle.medium()),
                    Text(
                        '${NumberFormat.decimalPattern().format(totalExpense)} đ',
                        style: tStyle.rMediumBold()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.inAndEx,
                        style: tStyle.medium()),
                    Text(
                        '${NumberFormat.decimalPattern().format(finalTotal)} đ',
                        style: tStyle.bMediumBold()),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 1, width: double.infinity, color: AppColors.grey),
          Flexible(
            child: ListView.builder(
              itemCount: nameCateList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.grey)),
                  ),
                  child: Row(
                    children: [
                      Text(nameCateList[index]),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
