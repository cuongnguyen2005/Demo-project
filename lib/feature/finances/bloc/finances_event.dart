import 'package:finance_app/feature/finances/income.dart';
import 'package:flutter/cupertino.dart';
import 'package:finance_app/feature/finances/expense.dart';

class FinancesEvent {}

class FinancesGetCateEvent extends FinancesEvent {
  final BuildContext context;
  FinancesGetCateEvent({
    required this.context,
  });
}

class FinancesAddAndEditExpenseEvent extends FinancesEvent {
  final ExpensePage widget;
  final BuildContext context;
  FinancesAddAndEditExpenseEvent({
    required this.widget,
    required this.context,
  });
}

class FinancesAddAndEditIncomeEvent extends FinancesEvent {
  final IncomePage widget;
  final BuildContext context;
  FinancesAddAndEditIncomeEvent({
    required this.widget,
    required this.context,
  });
}
