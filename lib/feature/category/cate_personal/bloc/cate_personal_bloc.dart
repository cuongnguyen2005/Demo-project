// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/component/dialog/dialog_success.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cate_personal_event.dart';
import 'cate_personal_state.dart';

class CatePersonalBloc extends Bloc<CatePersonalEvent, CatePersonalState> {
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController nameCateController = TextEditingController();
  String nameCate = '';
  int cateID = 0;
  int color = 0;
  String icon = '';
  List<int> colorList = [
    4294918273,
    4294266967,
    4291105122,
    4294922834,
    4294907716,
    4292149248,
    4294929984,
    4294917376,
    4292684800,
    4294945600,
    4294938880,
    4294929664,
    4294956864,
    4294951936,
    4294945536,
    4294967040,
    4294961664,
    4294956544,
    4293852993,
    4291231488,
    4289653248,
    4289920857,
    4285988611,
    4284800279,
    4284809178,
    4280150454,
    4278239141,
    4282434815,
    4278235391,
    4278227434,
    4282682111,
    4280908287,
    4280902399,
    4292886779,
    4292149497,
    4289331455,
    4288433663,
    4284817407,
    4284612842,
    4284301367,
    4283315246,
    4282263331,
    4282532418,
    4281348144,
    4280361249,
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
    'motorbike',
    'alarm',
    'airplane',
    'bag-personal',
    'bank',
    'barley',
    'bell',
    'bicycle',
    'bird',
    'book-education',
    'bullhorn',
    'camera',
    'car-hatchback',
    'cash'
  ];
  CatePersonalBloc() : super(CatePersonalInitial()) {
    on<CatePersonalEvent>((event, emit) {});
    on<CateGetListEvent>((event, emit) async {
      final List<Category> curListExpenseId = [];
      final List<Category> curListIncomeId = [];
      //get by id
      List<Category> categoryIdListDatabase =
          await FinanceRepo.getCateById(user!.uid);
      for (var element in categoryIdListDatabase) {
        if (element.cateID == 2) {
          curListExpenseId.add(element);
        }
        if (element.cateID == 1) {
          curListIncomeId.add(element);
        }
      }
      emit(CatePersonalState(
          categoryExpenseIdList: curListExpenseId,
          categoryIncomeIdList: curListIncomeId));
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
