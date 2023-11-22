import 'package:flutter/cupertino.dart';
import 'package:finance_app/feature/finances/expense/expense.dart';

class ExpenseEvent {}

class ExpenseGetCateEvent extends ExpenseEvent {
  final BuildContext context;
  ExpenseGetCateEvent({
    required this.context,
  });
}

class ExpenseAddAndEditEvent extends ExpenseEvent {
  final ExpensePage widget;
  final BuildContext context;
  ExpenseAddAndEditEvent({
    required this.widget,
    required this.context,
  });
}
