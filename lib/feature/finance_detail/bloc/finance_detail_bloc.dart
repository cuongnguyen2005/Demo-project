import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'finance_detail_event.dart';
import 'finance_detail_state.dart';

class FinanceDetailBloc extends Bloc<FinanceDetailEvent, FinanceDetailState> {
  User? user = FirebaseAuth.instance.currentUser;
  DateTime today = DateTime.now();
  FinanceDetailBloc() : super(FinanceDetailInitial()) {
    on<FinanceDetailEvent>((event, emit) {});
    on<FinanceDetailGetList>((event, emit) async {
      List<Finance> list = await FinanceRepo.getFinances(user!.uid);
      //sort finance by date
      list.sort((b, a) => a.dateTime.compareTo(b.dateTime));
      //show list by month
      final List<Finance> curList = [];
      for (var element in list) {
        if (DateTime.parse(element.dateTime).month == today.month &&
            DateTime.parse(element.dateTime).year == today.year) {
          curList.add(element);
        }
      }
      emit(FinanceDetailState(listByMonth: curList));
    });
  }
}
