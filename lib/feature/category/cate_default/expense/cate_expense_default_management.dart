import 'package:finance_app/feature/category/cate_default/expense/bloc/cate_expense_default_bloc.dart';
import 'package:finance_app/feature/category/cate_default/expense/bloc/cate_expense_default_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bloc/cate_expense_default_event.dart';

class CateExpenseDefaultManagement extends StatefulWidget {
  const CateExpenseDefaultManagement({super.key});
  static String routeName = 'cate_management';

  @override
  State<CateExpenseDefaultManagement> createState() =>
      _CateExpenseDefaultManagementState();
}

class _CateExpenseDefaultManagementState
    extends State<CateExpenseDefaultManagement> {
  @override
  void initState() {
    super.initState();
    getCate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CateExpenseDefaultBloc, CateExpenseDefaultState>(
        builder: (context, state) {
          List<Category> categoryExpenseDfList = state.categoryExpenseDfList;
          return SizedBox(
            height: size.height - 120,
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: categoryExpenseDfList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.grey))),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString(
                                  categoryExpenseDfList[index].icon),
                              color: Color(categoryExpenseDfList[index].color),
                            ),
                            const SizedBox(width: 16),
                            Text(categoryExpenseDfList[index].name,
                                style: tStyle.medium()),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: const BottomSheetButton(),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void getCate() {
    context
        .read<CateExpenseDefaultBloc>()
        .add(CateGetExpenseDefaultEvent(context: context));
  }
}
