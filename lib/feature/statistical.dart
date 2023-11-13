import 'package:collection/collection.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticalPage extends StatefulWidget {
  const StatisticalPage({super.key});

  @override
  State<StatisticalPage> createState() => _StatisticalPageState();
}

class _StatisticalPageState extends State<StatisticalPage> {
  Map<String, double> dataMap = {
    'Ăn uống': 1,
  };
  @override
  void initState() {
    super.initState();
    groupFinanceByCatename();
  }

  List<String> nameCateIncList = [];
  List<String> nameCateExpList = [];
  User? user = FirebaseAuth.instance.currentUser;

  void groupFinanceByCatename() async {
    List<Finance> list = await FinanceRepo.getFinances(user!.uid);
    final groups = groupBy(list, (Finance e) {
      return e.cateName;
    });
    groups.forEach((key, value) {
      value.forEachIndexed((index, element) {
        print(index);
        // if (element.cateID == 2) {
        //   print(element);
        // }
      });
      // print(key);
      // setState(() {
      //   nameCateList.add(key);
      // });
      // for (var element in value) {
      //   if (element.cateID == 1) {
      //     setState(() {
      //       nameCateIncList.add(key);
      //     });
      //   }
      //   if (element.cateID == 2) {
      //     setState(() {
      //       nameCateExpList.add(key);
      //     });
      //   }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text('Thống kê', style: tStyle.H5()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PieChart(
              dataMap: dataMap,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                itemCount: nameCateExpList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(nameCateExpList[index]),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
