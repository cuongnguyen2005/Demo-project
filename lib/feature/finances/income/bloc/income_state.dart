import 'package:finance_app/data/category.dart';

class IncomeState {
  final List<Category> cateIncome;
  IncomeState({
    this.cateIncome = const [],
  });
}

class IncomeInitial extends IncomeState {}
