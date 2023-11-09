// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expense extends StatefulWidget {
  const Expense({super.key, required this.isExpense});
  final bool isExpense;

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  void initState() {
    super.initState();
    getCategory();
  }

  User? user = FirebaseAuth.instance.currentUser;

  //phân loại danh mục
  List<Category> cateExpense = [];
  List<Category> cateIncome = [];
  void getCategory() {
    for (var element in cates) {
      if (element.cateID == 2) {
        setState(() {
          cateExpense.add(element);
        });
      }
      if (element.cateID == 1) {
        setState(() {
          cateIncome.add(element);
        });
      }
    }
  }

  //thêm mới thu chi
  void addFinance(int cateID, String cateName, int money, String dateTime,
      String note) async {
    if (user != null) {
      String? financeId = FirebaseDatabase.instance
          .ref()
          .child('finance')
          .child(user!.uid)
          .push()
          .key;
      Finance finance = Finance(
        cateID: cateID,
        cateName: cateName,
        money: money,
        dateTime: dateTime,
        note: note,
      );
      await FirebaseDatabase.instance
          .ref()
          .child('finance')
          .child(user!.uid)
          .child(financeId!)
          .set(finance.toMap());
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

  int choose = -1;
  String nameCate = '';
  int cateID = 0;
  final noteController = TextEditingController();
  final moneyController = TextEditingController();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                          child: Text('Ngày', style: tStyle.medium()),
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
                                DateFormat.yMMMMEEEEd().format(dateTime),
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
                            child: Text('Ghi chú', style: tStyle.medium())),
                        Expanded(
                          flex: 5,
                          child: InputDefault(
                            hintText: 'Nhập ghi chú',
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
                            child: Text('Số Tiền', style: tStyle.medium())),
                        Expanded(
                          flex: 5,
                          child: InputDefault(
                            hintText: 'Nhập số tiền',
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
                    Text('Danh mục', style: tStyle.medium()),
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
                      itemCount: widget.isExpense == true
                          ? cateExpense.length
                          : cateIncome.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              choose = index;
                              nameCate = widget.isExpense == true
                                  ? cateExpense[index].cateName
                                  : cateIncome[index].cateName;
                              cateID = widget.isExpense == true
                                  ? cateExpense[index].cateID
                                  : cateIncome[index].cateID;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: choose != index
                                    ? Border.all(
                                        color: AppColors.grey, width: 2)
                                    : Border.all(
                                        color: AppColors.themeColor, width: 2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              widget.isExpense == true
                                  ? cateExpense[index].cateName
                                  : cateIncome[index].cateName,
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
                      textButton: widget.isExpense == true
                          ? 'Nhập khoản chi'
                          : 'Nhập khoản thu',
                      onTap: () {
                        addFinanceDetail(cateID, nameCate);
                      },
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void addFinanceDetail(int cateID, String cateName) {
    if (moneyController.text.isNotEmpty) {
      if (nameCate != '') {
        int money = int.parse(moneyController.text);
        String datetime = dateTime.toIso8601String();
        addFinance(cateID, cateName, money, datetime, noteController.text);
        moneyController.clear();
        noteController.clear();
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text(
                'Bạn chưa chọn danh mục',
                textAlign: TextAlign.center,
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: ButtonPrimary(
                    textButton: 'Đồng ý',
                    onTap: onTapBack,
                  ),
                )
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text(
              'Bạn chưa nhập số tiền',
              textAlign: TextAlign.center,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: ButtonPrimary(
                  textButton: 'Đồng ý',
                  onTap: onTapBack,
                ),
              )
            ],
          );
        },
      );
    }
  }
}
