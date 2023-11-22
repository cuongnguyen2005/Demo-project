import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/feature/category/add_update_cate.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'bloc/cate_income_personal_bloc.dart';
import 'bloc/cate_income_personal_event.dart';
import 'bloc/cate_income_personal_state.dart';

class CateIncomePersonalManagement extends StatefulWidget {
  const CateIncomePersonalManagement({super.key});
  static String routeName = 'cate_management';

  @override
  State<CateIncomePersonalManagement> createState() =>
      _CateIncomePersonalManagementState();
}

class _CateIncomePersonalManagementState
    extends State<CateIncomePersonalManagement> {
  @override
  void initState() {
    super.initState();
    getCate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CateIncomePersonalBloc, CateIncomePersonalState>(
        builder: (context, state) {
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
                        child: ListView.builder(
                          itemCount: categoryIncomeIdList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) => onTapDelete(
                                        categoryIncomeIdList[index].id),
                                    backgroundColor: AppColors.red,
                                    foregroundColor: AppColors.white,
                                    icon: Icons.delete,
                                    label: AppLocalizations.of(context)!.delete,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () => onTapUpdateWidget(
                                    categoryIncomeIdList[index]),
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
                                          Icon(
                                            MdiIcons.fromString(
                                                categoryIncomeIdList[index]
                                                    .icon),
                                            color: Color(
                                                categoryIncomeIdList[index]
                                                    .color),
                                          ),
                                          const SizedBox(width: 16),
                                          Text(categoryIncomeIdList[index].name,
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
    context
        .read<CateIncomePersonalBloc>()
        .add(CateGetIncomeListEvent(context: context));
  }

  void onTapAddWidget() {
    Navigator.pushNamed(context, AddAndUpdateCate.routeName,
            arguments: AddAndUpdateCateArg(isExpenseCate: false))
        .then((_) => getCate());
  }

  void onTapDelete(String id) async {
    await FinanceRepo.deleteCate(
        context.read<CateIncomePersonalBloc>().user!.uid, id);
    getCate();
  }

  void onTapUpdateWidget(Category cate) {
    Navigator.pushNamed(context, AddAndUpdateCate.routeName,
            arguments: AddAndUpdateCateArg(isExpenseCate: false, cates: cate))
        .then((_) => getCate());
  }
}
