import 'package:finance_app/data/finance.dart';

class StatisState {
  final Map<String, double> sumMap;
  final List<Finance> listByMonth;
  final int totalExpense;
  final int totalIncome;
  final int finalTotal;

  StatisState({
    this.sumMap = const {},
    this.listByMonth = const [],
    this.totalExpense = 0,
    this.totalIncome = 0,
    this.finalTotal = 0,
  });
}

class StatisInitial extends StatisState {}
