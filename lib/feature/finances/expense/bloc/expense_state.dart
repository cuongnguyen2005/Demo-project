import 'package:finance_app/data/category.dart';

class ExpenseState {
  final List<Category> cateExpense;
  ExpenseState({
    this.cateExpense = const [],
  });
}

class ExpenseInitial extends ExpenseState {}

class ExpenseSuccessState extends ExpenseState {}

class ExpenseDialogMissing1State extends ExpenseState {}

class ExpenseDialogMissing2State extends ExpenseState {}

class ExpenseBackState extends ExpenseState {}

class ExpenseBack2State extends ExpenseState {}
