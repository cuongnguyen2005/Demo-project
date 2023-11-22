// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_app/data/category.dart';

class CateExpenseDefaultState {
  final List<Category> categoryExpenseDfList;
  CateExpenseDefaultState({
    this.categoryExpenseDfList = const [],
  });
}

class CateDefaultInitial extends CateExpenseDefaultState {}
