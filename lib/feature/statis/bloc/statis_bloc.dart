import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'statis_event.dart';
import 'statis_state.dart';

class StatisBloc extends Bloc<StatisEvent, StatisState> {
  User? user = FirebaseAuth.instance.currentUser;

  StatisBloc() : super(StatisInitial()) {
    on<StatisEvent>((event, emit) {});
    on<StatisGetMapMonthEvent>((event, emit) async {
      List<Finance> list = await FinanceRepo.getFinances(user!.uid);
      //show list by month
      List<Finance> curlistByMonth = [];
      for (var element in list) {
        if (DateTime.parse(element.dateTime).year == event.today.year &&
            DateTime.parse(element.dateTime).month == event.today.month) {
          curlistByMonth.add(element);
          emit(StatisState(listByMonth: curlistByMonth));
        }
      }

      //caculator
      int curTotalExpense = 0;
      int curTotalIncome = 0;
      for (var element in state.listByMonth) {
        if (element.cateID == 2) {
          curTotalExpense += element.money;
        }
        if (element.cateID == 1) {
          curTotalIncome += element.money;
        }
      }

      //tính tổng theo danh mục
      Map<String, double> cursumMap = {};
      for (var element in state.listByMonth) {
        if (cursumMap.containsKey(element.cateName)) {
          cursumMap[element.cateName] = cursumMap[element.cateName]! +
              double.parse(element.money.toString());
        } else {
          cursumMap[element.cateName] = double.parse(element.money.toString());
        }
      }
      emit(StatisState(
          totalExpenseMonth: curTotalExpense,
          totalIncomeMonth: curTotalIncome,
          finalTotalMonth: curTotalIncome - curTotalExpense,
          sumMapMonth: cursumMap));
    });

    //year
    on<StatisGetMapYearEvent>((event, emit) async {
      List<Finance> list = await FinanceRepo.getFinances(user!.uid);
      //show list by year
      List<Finance> curlistByYear = [];
      for (var element in list) {
        if (DateTime.parse(element.dateTime).year == event.today.year) {
          curlistByYear.add(element);
          emit(StatisState(listByYear: curlistByYear));
        }
      }

      //caculator
      int curTotalExpense = 0;
      int curTotalIncome = 0;
      for (var element in state.listByYear) {
        if (element.cateID == 2) {
          curTotalExpense += element.money;
        }
        if (element.cateID == 1) {
          curTotalIncome += element.money;
        }
      }

      //tính tổng theo danh mục
      Map<String, double> cursumMap = {};
      for (var element in state.listByYear) {
        if (cursumMap.containsKey(element.cateName)) {
          cursumMap[element.cateName] = cursumMap[element.cateName]! +
              double.parse(element.money.toString());
        } else {
          cursumMap[element.cateName] = double.parse(element.money.toString());
        }
      }
      emit(StatisState(
          totalExpenseYear: curTotalExpense,
          totalIncomeYear: curTotalIncome,
          finalTotalYear: curTotalIncome - curTotalExpense,
          sumMapYear: cursumMap));
    });
  }
}
