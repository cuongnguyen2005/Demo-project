import 'package:finance_app/feature/category/cate_default/bloc/cate_default_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'bloc/cate_default_event.dart';
import 'bloc/cate_default_state.dart';

class CateDefaultManagement extends StatefulWidget {
  const CateDefaultManagement({
    Key? key,
    required this.isExpenseCate,
  }) : super(key: key);
  final bool isExpenseCate;
  static String routeName = 'cate_management';

  @override
  State<CateDefaultManagement> createState() => _CateDefaultManagementState();
}

class _CateDefaultManagementState extends State<CateDefaultManagement> {
  @override
  void initState() {
    super.initState();
    getCate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CateDefaultBloc, CateDefaultState>(
        builder: (context, state) {
          List<Category> categoryIncomeDfList = state.categoryIncomeDfList;
          List<Category> categoryExpenseDfList = state.categoryExpenseDfList;
          return SizedBox(
            height: size.height - 120,
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: widget.isExpenseCate == true
                        ? categoryExpenseDfList.length
                        : categoryIncomeDfList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.grey))),
                        child: Row(
                          children: [
                            widget.isExpenseCate == true
                                ? Icon(
                                    MdiIcons.fromString(
                                        categoryExpenseDfList[index].icon),
                                    color: Color(
                                        categoryExpenseDfList[index].color),
                                  )
                                : Icon(
                                    MdiIcons.fromString(
                                        categoryIncomeDfList[index].icon),
                                    color: Color(
                                        categoryIncomeDfList[index].color),
                                  ),
                            const SizedBox(width: 16),
                            Text(
                                widget.isExpenseCate == true
                                    ? categoryExpenseDfList[index].name
                                    : categoryIncomeDfList[index].name,
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
    context.read<CateDefaultBloc>().add(CateGetDefaultEvent(context: context));
  }
}
