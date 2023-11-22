import 'package:finance_app/feature/finances/income/income.dart';
import 'package:flutter/material.dart';

class IncomeEvent {}

class IncomeGetCateEvent extends IncomeEvent {
  final BuildContext context;
  IncomeGetCateEvent({
    required this.context,
  });
}

class IncomeAddAndEditEvent extends IncomeEvent {
  final IncomePage widget;
  final BuildContext context;
  IncomeAddAndEditEvent({
    required this.widget,
    required this.context,
  });
}
