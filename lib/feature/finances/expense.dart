// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:finance_app/component/dialog/dialog_success.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpensePageArg {
  final bool isUpdate;
  final Finance? finances;
  final String? key;
  ExpensePageArg({
    required this.isUpdate,
    this.finances,
    this.key,
  });
}

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key, required this.arg});
  final ExpensePageArg arg;
  static String routeName = 'expense_page';

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  void initState() {
    super.initState();
    getCategory();
    noteController.text = widget.arg.finances?.note ?? '';
    moneyController.text = widget.arg.finances?.money.toString() ?? '';
    dateTime = DateTime.parse(
        widget.arg.finances?.dateTime ?? DateTime.now().toString());
    nameCate = widget.arg.finances?.cateName ?? '';
    cateID = widget.arg.finances?.cateID ?? 0;
  }

  User? user = FirebaseAuth.instance.currentUser;

  //phân loại danh mục
  List<Category> cateExpense = [];
  void getCategory() async {
    List<Category> listCateByIdDatabase =
        await FinanceRepo.getCateById(user!.uid);
    for (var element in cates) {
      if (element.cateID == 2) {
        setState(() {
          cateExpense.add(element);
        });
      }
    }
    for (var element in listCateByIdDatabase) {
      if (element.cateID == 2) {
        setState(() {
          cateExpense.add(element);
        });
      }
    }
  }

  //chọn ngày
  void _showDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2300),
    );
    if (picked != null) {
      setState(() {
        dateTime = picked;
      });
    }
  }

  String nameCate = '';
  int cateID = 0;
  final TextEditingController noteController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: widget.arg.isUpdate == true
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.themeColor,
              title: Center(
                child: Text(AppLocalizations.of(context)!.update,
                    style: tStyle.H5()),
              ),
            )
          : null,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // textbox nhập nội dung
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(AppLocalizations.of(context)!.date,
                              style: tStyle.medium()),
                        ),
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: _showDatePicker,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColors.lightYellow,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                DateFormat.yMEd().format(dateTime),
                                style: tStyle.medium(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(AppLocalizations.of(context)!.notes,
                                style: tStyle.medium())),
                        Expanded(
                          flex: 5,
                          child: InputDefault(
                            hintText: AppLocalizations.of(context)!.enterNote,
                            obscureText: false,
                            controller: noteController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(AppLocalizations.of(context)!.money,
                                style: tStyle.medium())),
                        Expanded(
                          flex: 5,
                          child: InputDefault(
                            hintText: AppLocalizations.of(context)!.enterMoney,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            controller: moneyController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                //lựa chọn danh mục
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.cate,
                        style: tStyle.medium()),
                  ],
                ),
                SizedBox(height: 16),

                Container(
                  height: 200,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: cateExpense.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              nameCate = cateExpense[index].name;
                              cateID = cateExpense[index].cateID;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: nameCate != cateExpense[index].name
                                    ? Border.all(
                                        color: AppColors.grey, width: 2)
                                    : Border.all(
                                        color: AppColors.themeColor, width: 2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              cateExpense[index].name,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 40),
                //button
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonPrimary(
                      textButton: widget.arg.isUpdate == false
                          ? AppLocalizations.of(context)!.submit
                          : AppLocalizations.of(context)!.update,
                      onTap: () {
                        addFinanceDetail(cateID, nameCate);
                      },
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: widget.arg.isUpdate == true ? BottomSheetButton() : null,
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogSuccess();
      },
    );
  }

  void pushBottom() {
    Navigator.pushNamedAndRemoveUntil(
        context, Bottom.routeName, (route) => false,
        arguments: true);
  }

  void addFinanceDetail(int cateID, String cateName) async {
    if (moneyController.text.isNotEmpty) {
      if (nameCate != '') {
        //hiển thị thông báo thành công
        showSuccess();
        int money = int.parse(moneyController.text);
        String datetime = dateTime.toIso8601String();
        widget.arg.isUpdate == false
            ? await FinanceRepo.addFinances(user!.uid, cateID, cateName, money,
                datetime, noteController.text)
            : await FinanceRepo.editFinances(user!.uid, widget.arg.key!, cateID,
                cateName, money, datetime, noteController.text);
        if (widget.arg.isUpdate == true) {
          pushBottom();
        } else {
          onTapBack();
          moneyController.clear();
          noteController.clear();
          setState(() {
            nameCate = '';
          });
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return DialogPrimary(
              content: AppLocalizations.of(context)!.selectCate,
              onTap: onTapBack,
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return DialogPrimary(
            content: AppLocalizations.of(context)!.selectMoney,
            onTap: onTapBack,
          );
        },
      );
    }
  }
}
