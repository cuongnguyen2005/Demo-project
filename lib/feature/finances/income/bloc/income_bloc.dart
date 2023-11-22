// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:finance_app/component/dialog/dialog_success.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'income_event.dart';
import 'income_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController noteController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  DateTime dateTime = DateTime.now();
  String nameCate = '';
  int cateID = 0;
  int color = 0;
  String icon = '';
  IncomeBloc() : super(IncomeInitial()) {
    on<IncomeEvent>((event, emit) {});
    //get cate expense
    on<IncomeGetCateEvent>((event, emit) async {
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

      List<Category> listCateByIdDatabase =
          await FinanceRepo.getCateById(user!.uid);
      List<Category> curIncomeList = [];
      for (var element in cates) {
        if (element.cateID == 1) {
          curIncomeList.add(element);
          emit(IncomeState(cateIncome: curIncomeList));
        }
      }
      for (var element in listCateByIdDatabase) {
        if (element.cateID == 1) {
          curIncomeList.add(element);
          emit(IncomeState(cateIncome: curIncomeList));
        }
      }
    });

    //add and edit income
    on<IncomeAddAndEditEvent>((event, emit) async {
      if (moneyController.text.isNotEmpty) {
        if (nameCate != '') {
          //hiển thị thông báo thành công
          showDialog(
            context: event.context,
            builder: (context) {
              return const DialogSuccess();
            },
          );
          int money = int.parse(moneyController.text);
          String datetime = dateTime.toIso8601String();
          event.widget.arg.isUpdate == false
              ? await FinanceRepo.addFinances(user!.uid, cateID, nameCate,
                  money, datetime, color, icon, noteController.text)
              : await FinanceRepo.editFinances(
                  user!.uid,
                  event.widget.arg.key!,
                  cateID,
                  nameCate,
                  money,
                  datetime,
                  color,
                  icon,
                  noteController.text);
          if (event.widget.arg.isUpdate == true) {
            Navigator.pushNamedAndRemoveUntil(
                event.context, Bottom.routeName, (route) => false,
                arguments: true);
          } else {
            Navigator.pop(event.context);
            moneyController.clear();
            noteController.clear();
            nameCate = '';
          }
        } else {
          showDialog(
            context: event.context,
            builder: (context) {
              return DialogPrimary(
                content: AppLocalizations.of(context)!.selectCate,
                onTap: () {
                  Navigator.pop(context);
                },
              );
            },
          );
        }
      } else {
        showDialog(
          context: event.context,
          builder: (context) {
            return DialogPrimary(
              content: AppLocalizations.of(context)!.selectMoney,
              onTap: () {
                Navigator.pop(context);
              },
            );
          },
        );
      }
    });
  }
}
