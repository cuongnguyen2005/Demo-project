import 'package:finance_app/component/btn/btn_select_day.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc/statis_bloc.dart';
import 'bloc/statis_event.dart';
import 'bloc/statis_state.dart';

class YearStatisticalPage extends StatefulWidget {
  const YearStatisticalPage({super.key});

  @override
  State<YearStatisticalPage> createState() => _YearStatisticalPageState();
}

class _YearStatisticalPageState extends State<YearStatisticalPage> {
  @override
  void initState() {
    super.initState();
    groupFinanceByDay();
  }

  void groupFinanceByDay() {
    context.read<StatisBloc>().add(StatisGetMapYearEvent(today: today));
  }

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<StatisBloc, StatisState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  final selected = await showMonthPicker(
                    context: context,
                    initialDate: today,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050),
                  );
                  if (selected != null) {
                    setState(() {
                      today = selected;
                    });
                    groupFinanceByDay();
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: ButtonSelectDay(text: DateFormat.y().format(today)),
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
                            '${NumberFormat.decimalPattern().format(state.totalIncomeYear)} đ',
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
                            '${NumberFormat.decimalPattern().format(state.totalExpenseYear)} đ',
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
                            '${NumberFormat.decimalPattern().format(state.finalTotalYear)} đ',
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
              Container(
                  height: 1, width: double.infinity, color: AppColors.grey),
              Flexible(
                child: ListView.builder(
                  itemCount: state.sumMapYear.length,
                  itemBuilder: (context, index) {
                    String key = state.sumMapYear.keys.elementAt(index);
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: AppColors.grey)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(key, style: tStyle.medium()),
                          Text(
                            '${NumberFormat.decimalPattern().format(state.sumMapYear[key])} đ',
                            style: tStyle.medium(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
