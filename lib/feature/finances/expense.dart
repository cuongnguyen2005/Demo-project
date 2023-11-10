// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/dialog/dialog_primary.dart';
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
  void getCategory() {
    for (var element in cates) {
      if (element.cateID == 2) {
        setState(() {
          cateExpense.add(element);
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

  //update thu chi
  void updateFinance(int cateID, String cateName, int money, String dateTime,
      String note) async {
    if (user != null) {
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
          .child(widget.arg.key!)
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

  String nameCate = '';
  int cateID = 0;
  final noteController = TextEditingController();
  final moneyController = TextEditingController();
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
                child: Text('Chỉnh sửa', style: tStyle.H5()),
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
                      itemCount: cateExpense.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              nameCate = cateExpense[index].cateName;
                              cateID = cateExpense[index].cateID;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: nameCate != cateExpense[index].cateName
                                    ? Border.all(
                                        color: AppColors.grey, width: 2)
                                    : Border.all(
                                        color: AppColors.themeColor, width: 2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              cateExpense[index].cateName,
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
                          ? 'Nhập khoản chi'
                          : 'Chỉnh sửa khoản chi',
                      onTap: () {
                        addFinanceDetail(cateID, nameCate);
                      },
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: widget.arg.isUpdate == true
          ? Container(
              width: double.infinity,
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: ButtonNoBox(
                textButton: 'Quay về',
                onTap: onTapBack,
              ),
            )
          : null,
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
        widget.arg.isUpdate == false
            ? addFinance(cateID, cateName, money, datetime, noteController.text)
            : updateFinance(
                cateID, cateName, money, datetime, noteController.text);
        if (widget.arg.isUpdate == true) {
          Navigator.pop(context);
        }
        moneyController.clear();
        noteController.clear();
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return DialogPrimary(
              content: 'Bạn chưa chọn danh mục',
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
            content: 'Bạn chưa nhập số tiền',
            onTap: onTapBack,
          );
        },
      );
    }
  }
}
