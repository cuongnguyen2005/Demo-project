import 'package:finance_app/component/app_bar/app_bar_primary.dart';
import 'package:finance_app/feature/category/cate_personal/bloc/cate_personal_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'cate_personal/bloc/cate_personal_bloc.dart';

class AddAndUpdateCateArg {
  final Category? cates;
  final bool isExpenseCate;
  AddAndUpdateCateArg({
    this.cates,
    required this.isExpenseCate,
  });
}

class AddAndUpdateCate extends StatefulWidget {
  const AddAndUpdateCate({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final AddAndUpdateCateArg arg;
  static String routeName = 'update_expense_cate';

  @override
  State<AddAndUpdateCate> createState() => _AddAndUpdateCateState();
}

class _AddAndUpdateCateState extends State<AddAndUpdateCate> {
  @override
  void initState() {
    super.initState();
    context.read<CatePersonalBloc>().nameCateController.text =
        widget.arg.cates?.name ?? '';
    widget.arg.isExpenseCate == true
        ? context.read<CatePersonalBloc>().nameCate = 'Khoản chi'
        : context.read<CatePersonalBloc>().nameCate = 'Khoản thu';
    context.read<CatePersonalBloc>().color = widget.arg.cates?.color ?? 0;
    context.read<CatePersonalBloc>().icon = widget.arg.cates?.icon ?? '';
    widget.arg.isExpenseCate == true
        ? context.read<CatePersonalBloc>().cateID = 2
        : context.read<CatePersonalBloc>().cateID = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: AppLocalizations.of(context)!.navi1),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                InputDefault(
                  hintText: AppLocalizations.of(context)!.cateName,
                  obscureText: false,
                  controller:
                      context.read<CatePersonalBloc>().nameCateController,
                ),
                const SizedBox(height: 16),

                //lựa chọn icon
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.icon,
                          style: tStyle.medium()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount:
                          context.read<CatePersonalBloc>().iconList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        List<String> iconList =
                            context.read<CatePersonalBloc>().iconList;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              context.read<CatePersonalBloc>().icon =
                                  iconList[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: context.read<CatePersonalBloc>().icon !=
                                        iconList[index]
                                    ? Border.all(
                                        color: AppColors.grey, width: 2)
                                    : Border.all(
                                        color: AppColors.black, width: 2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Icon(
                              MdiIcons.fromString(iconList[index]),
                            ),
                          ),
                        );
                      }),
                ),
                //lựa chọn color
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.color,
                          style: tStyle.medium()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount:
                          context.read<CatePersonalBloc>().colorList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        List<int> colorList =
                            context.read<CatePersonalBloc>().colorList;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              context.read<CatePersonalBloc>().color =
                                  colorList[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    context.read<CatePersonalBloc>().color !=
                                            colorList[index]
                                        ? Border.all(
                                            color: AppColors.grey, width: 2)
                                        : Border.all(
                                            color: AppColors.black, width: 2),
                                borderRadius: BorderRadius.circular(16),
                                color: Color(colorList[index])),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 16),
                ButtonPrimary(
                  textButton: widget.arg.cates == null
                      ? AppLocalizations.of(context)!.submit
                      : AppLocalizations.of(context)!.update,
                  onTap: () => widget.arg.cates == null
                      ? onTapAddCate()
                      : onTapUpdateCate(widget.arg.cates?.id ?? ''),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: const BottomSheetButton(),
    );
  }

  void onTapAddCate() async {
    context.read<CatePersonalBloc>().add(CateAddEvent(context: context));
  }

  void onTapUpdateCate(String id) async {
    context
        .read<CatePersonalBloc>()
        .add(CateUpdateEvent(context: context, id: id));
  }
}
