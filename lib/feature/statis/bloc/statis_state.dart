import 'package:finance_app/data/finance.dart';

class StatisState {
  final Map<String, double> sumMapMonth;
  final List<Finance> listByMonth;
  final int totalExpenseMonth;
  final int totalIncomeMonth;
  final int finalTotalMonth;
  final Map<String, double> sumMapYear;
  final List<Finance> listByYear;
  final int totalExpenseYear;
  final int totalIncomeYear;
  final int finalTotalYear;
  StatisState({
    this.sumMapMonth = const {},
    this.listByMonth = const [],
    this.totalExpenseMonth = 0,
    this.totalIncomeMonth = 0,
    this.finalTotalMonth = 0,
    this.sumMapYear = const {},
    this.listByYear = const [],
    this.totalExpenseYear = 0,
    this.totalIncomeYear = 0,
    this.finalTotalYear = 0,
  });
}

class StatisInitial extends StatisState {}
