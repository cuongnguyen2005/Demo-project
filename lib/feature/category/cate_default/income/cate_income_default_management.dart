import 'package:finance_app/feature/category/cate_default/income/bloc/cate_income_default_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bloc/cate_income_default_event.dart';
import 'bloc/cate_income_default_state.dart';

class CateIncomeDefaultManagement extends StatefulWidget {
  const CateIncomeDefaultManagement({super.key});
  static String routeName = 'cate_management';

  @override
  State<CateIncomeDefaultManagement> createState() =>
      _CateIncomeDefaultManagementState();
}

class _CateIncomeDefaultManagementState
    extends State<CateIncomeDefaultManagement> {
  @override
  void initState() {
    super.initState();
    getCate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CateIncomeDefaultBloc, CateIncomeDefaultState>(
        builder: (context, state) {
          List<Category> categoryIncomeDfList = state.categoryIncomeDfList;
          return SizedBox(
            height: size.height - 120,
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: categoryIncomeDfList.length,
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
                                  categoryIncomeDfList[index].icon),
                              color: Color(categoryIncomeDfList[index].color),
                            ),
                            const SizedBox(width: 16),
                            Text(categoryIncomeDfList[index].name,
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
        .read<CateIncomeDefaultBloc>()
        .add(CateGetIncomeDefaultEvent(context: context));
  }
}
