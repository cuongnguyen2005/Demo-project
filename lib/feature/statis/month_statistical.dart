import 'package:finance_app/component/btn/btn_select_day.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MonthStatisticalPage extends StatefulWidget {
  const MonthStatisticalPage({super.key});

  @override
  State<MonthStatisticalPage> createState() => _MonthStatisticalPageState();
}

class _MonthStatisticalPageState extends State<MonthStatisticalPage> {
  @override
  void initState() {
    super.initState();
    groupFinanceByDay();
  }

  User? user = FirebaseAuth.instance.currentUser;
  List<Finance> listByMonth = [];
  Map<String, double> sumMap = {};

  void groupFinanceByDay() async {
    List<Finance> list = await FinanceRepo.getFinances(user!.uid);
    List<Finance> financeList = [];
    setState(() {
      financeList = list;
    });

    //show list by month
    listByMonth = [];
    for (var element in financeList) {
      if (DateTime.parse(element.dateTime).year == today.year &&
          DateTime.parse(element.dateTime).month == today.month) {
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

    //tính tổng theo danh mục
    sumMap = {};
    for (var element in listByMonth) {
      if (sumMap.containsKey(element.cateName)) {
        sumMap[element.cateName] =
            sumMap[element.cateName]! + double.parse(element.money.toString());
      } else {
        sumMap[element.cateName] = double.parse(element.money.toString());
      }
    }
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
                initialMonthYearPickerMode: MonthYearPickerMode.month,
                initialDate: today,
                firstDate: DateTime(2010),
                lastDate: DateTime(2050),
              );
              if (selected != null) {
                setState(() {
                  today = selected;
                  groupFinanceByDay();
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ButtonSelectDay(text: DateFormat.yM().format(today)),
            ),
          ),

          //tổng quan tiền
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(width: 1, color: AppColors.grey),
                borderRadius: BorderRadius.circular(10)),
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
          // Expanded(
          //   child: PieChart(
          //     dataMap: sumMap,
          //     chartValuesOptions: const ChartValuesOptions(
          //       showChartValuesInPercentage: true,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 16),
          Container(height: 1, width: double.infinity, color: AppColors.grey),
          Flexible(
            child: ListView.builder(
              itemCount: sumMap.length,
              itemBuilder: (context, index) {
                String key = sumMap.keys.elementAt(index);
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(key, style: tStyle.medium()),
                      Text(
                        '${NumberFormat.decimalPattern().format(sumMap[key])} đ',
                        style: tStyle.medium(),
                      ),
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
