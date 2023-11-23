import 'package:finance_app/data/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cate_default_event.dart';
import 'cate_default_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CateDefaultBloc extends Bloc<CateDefaultEvent, CateDefaultState> {
  CateDefaultBloc() : super(CateDefaultInitial()) {
    on<CateDefaultEvent>((event, emit) {});
    on<CateGetDefaultEvent>((event, emit) {
      final List<Category> curListExpenseDf = [];
      final List<Category> curListIncomeDf = [];
      List<Category> cates = [
        Category(
            id: "",
            cateName: "Khoản thu",
            name: AppLocalizations.of(event.context)!.salary,
            cateID: 1,
            color: 4294940672,
            icon: 'wallet'),
        Category(
            id: "",
            cateName: "Khoản thu",
            name: AppLocalizations.of(event.context)!.poketmoney,
            cateID: 1,
            color: 4278226216,
            icon: 'pig-variant-outline'),
        Category(
            id: "",
            cateName: "Khoản thu",
            name: AppLocalizations.of(event.context)!.bonus,
            cateID: 1,
            color: 4294198070,
            icon: 'gift'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.eat,
            cateID: 2,
            color: 4294940672,
            icon: 'food-fork-drink'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.houseware,
            cateID: 2,
            color: 4278226216,
            icon: 'shopping'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.clothes,
            cateID: 2,
            color: 4279895849,
            icon: 'hanger'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.cosmetic,
            cateID: 2,
            color: 4293467747,
            icon: 'lipstick'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.medical,
            cateID: 2,
            color: 4294961979,
            icon: 'pill-multiple'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.education,
            cateID: 2,
            color: 4294198070,
            icon: 'school'),
        Category(
            id: "",
            cateName: "Khoản chi",
            name: AppLocalizations.of(event.context)!.transport,
            cateID: 2,
            color: 4286141768,
            icon: 'motorbike'),
      ];

      //get default
      for (var element1 in cates) {
        if (element1.cateID == 2) {
          curListExpenseDf.add(element1);
        }
        if (element1.cateID == 1) {
          curListIncomeDf.add(element1);
        }
      }
      emit(CateDefaultState(
          categoryExpenseDfList: curListExpenseDf,
          categoryIncomeDfList: curListIncomeDf));
    });
  }
}
