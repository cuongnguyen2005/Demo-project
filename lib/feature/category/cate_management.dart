// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/feature/category/update_cate.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CateManagement extends StatefulWidget {
  const CateManagement({
    Key? key,
    required this.isCateExpense,
  }) : super(key: key);
  final bool isCateExpense;
  static String routeName = 'cate_management';

  @override
  State<CateManagement> createState() => _CateManagementState();
}

class _CateManagementState extends State<CateManagement> {
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
    getCate();
  }

  User? user;
  List<Category> categoryExpenseIdList = [];
  List<Category> categoryExpenseDfList = [];
  List<Category> categoryIncomeIdList = [];
  List<Category> categoryIncomeDfList = [];

  void getCate() async {
    //get by id
    List<Category> categoryIdListDatabase =
        await FinanceRepo.getCateById(user!.uid);
    categoryExpenseIdList = [];
    categoryIncomeIdList = [];
    for (var element in categoryIdListDatabase) {
      if (element.cateID == 2) {
        setState(() {
          categoryExpenseIdList.add(element);
        });
      }
      if (element.cateID == 1) {
        setState(() {
          categoryIncomeIdList.add(element);
        });
      }
    }

    //get default
    for (var element in cates) {
      if (element.cateID == 2) {
        setState(() {
          categoryExpenseDfList.add(element);
        });
      }
      if (element.cateID == 1) {
        setState(() {
          categoryIncomeDfList.add(element);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        height: size.height - 120,
        child: Column(
          children: [
            ButtonPrimary(
              textButton: AppLocalizations.of(context)!.navi1,
              onTap: onTapAddWidget,
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.cateDf,
                        style: tStyle.H6()),
                    Flexible(
                      child: ListView.builder(
                        itemCount: widget.isCateExpense == true
                            ? categoryExpenseDfList.length
                            : categoryIncomeDfList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: AppColors.grey))),
                            child: Text(
                                widget.isCateExpense == true
                                    ? categoryExpenseDfList[index].name
                                    : categoryIncomeDfList[index].name,
                                style: tStyle.medium()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.catePersonal,
                        style: tStyle.H6()),
                    Flexible(
                      child: ListView.builder(
                        itemCount: widget.isCateExpense == true
                            ? categoryExpenseIdList.length
                            : categoryIncomeIdList.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => onTapDelete(
                                      widget.isCateExpense == true
                                          ? categoryExpenseIdList[index].id
                                          : categoryIncomeIdList[index].id),
                                  backgroundColor: AppColors.red,
                                  foregroundColor: AppColors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () => onTapUpdateWidget(
                                  widget.isCateExpense == true
                                      ? categoryExpenseIdList[index]
                                      : categoryIncomeIdList[index]),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 5),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: AppColors.grey))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        widget.isCateExpense == true
                                            ? categoryExpenseIdList[index].name
                                            : categoryIncomeIdList[index].name,
                                        style: tStyle.medium()),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: const BottomSheetButton(),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapAddWidget() {
    Navigator.pushNamed(context, UpdateCate.routeName).then((_) => setState(() {
          getCate();
        }));
  }

  void onTapDelete(String id) async {
    await FinanceRepo.deleteCate(user!.uid, id);
    setState(() {
      getCate();
    });
  }

  void onTapUpdateWidget(Category cate) {
    Navigator.pushNamed(context, UpdateCate.routeName, arguments: cate)
        .then((_) => setState(() {
              getCate();
            }));
  }
}
