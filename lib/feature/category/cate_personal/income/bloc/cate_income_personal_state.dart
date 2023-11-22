import 'package:finance_app/data/category.dart';

class CateIncomePersonalState {
  final List<Category> categoryIncomeIdList;
  CateIncomePersonalState({
    this.categoryIncomeIdList = const [],
  });
}

class CateInitial extends CateIncomePersonalState {}
