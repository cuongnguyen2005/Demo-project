import 'package:finance_app/data/category.dart';

class FinancesState {
  final List<Category> cateExpense;
  final List<Category> cateIncome;
  FinancesState({
    this.cateExpense = const [],
    this.cateIncome = const [],
  });
}

class FinancesInitial extends FinancesState {}

class ExpenseSuccessState extends FinancesState {}

class ExpenseDialogMissing1State extends FinancesState {}

class ExpenseDialogMissing2State extends FinancesState {}

class ExpenseBackState extends FinancesState {}

class ExpenseBack2State extends FinancesState {}
