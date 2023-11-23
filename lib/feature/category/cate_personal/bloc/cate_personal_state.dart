import 'package:finance_app/data/category.dart';

class CatePersonalState {
  final List<Category> categoryExpenseIdList;
  final List<Category> categoryIncomeIdList;
  CatePersonalState({
    this.categoryExpenseIdList = const [],
    this.categoryIncomeIdList = const [],
  });
}

class CatePersonalInitial extends CatePersonalState {}
