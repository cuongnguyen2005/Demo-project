// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_app/data/category.dart';

class CateDefaultState {
  final List<Category> categoryExpenseDfList;
  final List<Category> categoryIncomeDfList;
  CateDefaultState({
    this.categoryExpenseDfList = const [],
    this.categoryIncomeDfList = const [],
  });
}

class CateDefaultInitial extends CateDefaultState {}
