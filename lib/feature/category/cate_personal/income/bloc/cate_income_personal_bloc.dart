// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/component/dialog/dialog_success.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cate_income_personal_event.dart';
import 'cate_income_personal_state.dart';

class CateIncomePersonalBloc
    extends Bloc<CateIncomePersonalEvent, CateIncomePersonalState> {
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController nameCateController = TextEditingController();
  String nameCate = '';
  int cateID = 0;
  int color = 0;
  String icon = '';
  List<int> colorList = [
    4294940672,
    4278226216,
    4279895849,
    4293467747,
    4294961979,
    4294198070,
    4286141768
  ];
  List<String> iconList = [
    'wallet',
    'pig-variant-outline',
    'gift',
    'food-fork-drink',
    'shopping',
    'hanger',
    'lipstick',
    'pill-multiple',
    'school',
    'motorbike'
  ];
  CateIncomePersonalBloc() : super(CateInitial()) {
    on<CateIncomePersonalEvent>((event, emit) {});
    on<CateGetIncomeListEvent>((event, emit) async {
      final List<Category> curListIncomeId = [];
      //get by id
      List<Category> categoryIdListDatabase =
          await FinanceRepo.getCateById(user!.uid);
      for (var element in categoryIdListDatabase) {
        if (element.cateID == 1) {
          curListIncomeId.add(element);
          emit(CateIncomePersonalState(categoryIncomeIdList: curListIncomeId));
        }
      }
    });
    on<CateAddEvent>((event, emit) async {
      if (nameCateController.text.isNotEmpty) {
        showDialog(
          context: event.context,
          builder: (context) {
            return const DialogSuccess();
          },
        );
        await FinanceRepo.addCateById(
            user!.uid, cateID, nameCate, nameCateController.text, color, icon);
        Navigator.of(event.context)
          ..pop()
          ..pop();
      }
    });
    on<CateUpdateEvent>((event, emit) async {
      if (nameCateController.text.isNotEmpty) {
        showDialog(
          context: event.context,
          builder: (context) {
            return const DialogSuccess();
          },
        );
        await FinanceRepo.updateCateById(user!.uid, event.id, cateID, nameCate,
            nameCateController.text, color, icon);
        Navigator.of(event.context)
          ..pop()
          ..pop();
      }
    });
  }
}
