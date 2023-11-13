// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:finance_app/feature/category/update_cate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';

class CateExpense extends StatefulWidget {
  const CateExpense({super.key});
  static String routeName = 'cate_management';

  @override
  State<CateExpense> createState() => _CateExpenseState();
}

class _CateExpenseState extends State<CateExpense> {
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
    getCate();
  }

  User? user;
  List<Category> categoryIdList = [];
  List<Category> categoryDfList = [];

  void getCate() async {
    //get by id
    List<Category> categoryIdListDatabase =
        await FinanceRepo.getCateById(user!.uid);
    categoryIdList = [];
    for (var element in categoryIdListDatabase) {
      if (element.cateID == 2) {
        setState(() {
          categoryIdList.add(element);
        });
      }
    }

    //get default
    for (var element in cates) {
      if (element.cateID == 2) {
        setState(() {
          categoryDfList.add(element);
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
              textButton: 'Thêm',
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
                    Text('Danh mục mặc định', style: tStyle.H6()),
                    Flexible(
                      child: ListView.builder(
                        itemCount: categoryDfList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: AppColors.grey))),
                            child: Text(categoryDfList[index].name,
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
                    Text('Danh mục của bạn', style: tStyle.H6()),
                    Flexible(
                      child: ListView.builder(
                        itemCount: categoryIdList.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) =>
                                      onTapDelete(categoryIdList[index].id),
                                  backgroundColor: AppColors.red,
                                  foregroundColor: AppColors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () =>
                                  onTapUpdateWidget(categoryIdList[index]),
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
                                    Text(categoryIdList[index].name,
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
      bottomSheet: Container(
        width: double.infinity,
        color: AppColors.white,
        padding: const EdgeInsets.all(16),
        child: ButtonNoBox(
          textButton: 'Quay về',
          onTap: onTapBack,
        ),
      ),
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
