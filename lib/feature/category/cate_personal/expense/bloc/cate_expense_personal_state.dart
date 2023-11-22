import 'package:finance_app/data/category.dart';

class CateExpensePersonalState {
  final List<Category> categoryExpenseIdList;

  CateExpensePersonalState({
    this.categoryExpenseIdList = const [],
  });
}

class CateInitial extends CateExpensePersonalState {}
