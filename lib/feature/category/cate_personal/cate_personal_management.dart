import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/feature/category/add_update_cate.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'bloc/cate_personal_bloc.dart';
import 'bloc/cate_personal_event.dart';
import 'bloc/cate_personal_state.dart';

class CatePersonalManagement extends StatefulWidget {
  const CatePersonalManagement({
    Key? key,
    required this.isCateExpense,
  }) : super(key: key);
  final bool isCateExpense;
  static String routeName = 'cate_management';

  @override
  State<CatePersonalManagement> createState() => _CatePersonalManagementState();
}

class _CatePersonalManagementState extends State<CatePersonalManagement> {
  @override
  void initState() {
    super.initState();
    getCate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CatePersonalBloc, CatePersonalState>(
        builder: (context, state) {
          List<Category> categoryExpenseIdList = state.categoryExpenseIdList;
          List<Category> categoryIncomeIdList = state.categoryIncomeIdList;
          return Container(
            padding: const EdgeInsets.all(16),
            height: size.height - 120,
            child: Column(
              children: [
                ButtonPrimary(
                  textButton: AppLocalizations.of(context)!.navi1,
                  onTap: onTapAddWidget,
                ),
                const SizedBox(height: 16),

                //cate by id user
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.catePersonal,
                          style: tStyle.H6()),
                      Flexible(
                        child: SlidableAutoCloseBehavior(
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
                                      label:
                                          AppLocalizations.of(context)!.delete,
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
                                                width: 1,
                                                color: AppColors.grey))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            widget.isCateExpense == true
                                                ? Icon(
                                                    MdiIcons.fromString(
                                                        categoryExpenseIdList[
                                                                index]
                                                            .icon),
                                                    color: Color(
                                                        categoryExpenseIdList[
                                                                index]
                                                            .color),
                                                  )
                                                : Icon(
                                                    MdiIcons.fromString(
                                                        categoryIncomeIdList[
                                                                index]
                                                            .icon),
                                                    color: Color(
                                                        categoryIncomeIdList[
                                                                index]
                                                            .color),
                                                  ),
                                            const SizedBox(width: 16),
                                            Text(
                                                widget.isCateExpense == true
                                                    ? categoryExpenseIdList[
                                                            index]
                                                        .name
                                                    : categoryIncomeIdList[
                                                            index]
                                                        .name,
                                                style: tStyle.medium()),
                                          ],
                                        ),
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
                        ),
                      )
                    ],
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
    context.read<CatePersonalBloc>().add(CateGetListEvent(context: context));
  }

  void onTapAddWidget() {
    widget.isCateExpense == true
        ? Navigator.pushNamed(context, AddAndUpdateCate.routeName,
                arguments: AddAndUpdateCateArg(isExpenseCate: true))
            .then((_) => getCate())
        : Navigator.pushNamed(context, AddAndUpdateCate.routeName,
                arguments: AddAndUpdateCateArg(isExpenseCate: false))
            .then((_) => getCate());
  }

  void onTapDelete(String id) async {
    await FinanceRepo.deleteCate(
        context.read<CatePersonalBloc>().user!.uid, id);
    getCate();
  }

  void onTapUpdateWidget(Category cate) {
    widget.isCateExpense == true
        ? Navigator.pushNamed(context, AddAndUpdateCate.routeName,
                arguments:
                    AddAndUpdateCateArg(isExpenseCate: true, cates: cate))
            .then((_) => getCate())
        : Navigator.pushNamed(context, AddAndUpdateCate.routeName,
                arguments:
                    AddAndUpdateCateArg(isExpenseCate: false, cates: cate))
            .then((_) => getCate());
  }
}
