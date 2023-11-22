// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_app/data/finance.dart';

class FinanceDetailState {
  final List<Finance> listByMonth;
  FinanceDetailState({
    this.listByMonth = const [],
  });
}

class FinanceDetailInitial extends FinanceDetailState {}
