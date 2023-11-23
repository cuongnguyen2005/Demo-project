import 'package:finance_app/component/app_bar/app_bar_primary.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/btn_select_day.dart';
import 'package:finance_app/component/form_field/input_secondary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/feature/finances/income/bloc/income_bloc.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bloc/income_event.dart';
import 'bloc/income_state.dart';

class IncomePageArg {
  final bool isUpdate;
  final Finance? finances;
  final String? key;
  IncomePageArg({
    required this.isUpdate,
    this.finances,
    this.key,
  });
}

class IncomePage extends StatefulWidget {
  const IncomePage({super.key, required this.arg});
  final IncomePageArg arg;
  static String routeName = 'income_page';

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  void initState() {
    super.initState();
    context.read<IncomeBloc>().add(IncomeGetCateEvent(context: context));
    context.read<IncomeBloc>().noteController.text =
        widget.arg.finances?.note ?? '';
    context.read<IncomeBloc>().moneyController.text =
        widget.arg.finances?.money.toString() ?? '';
    context.read<IncomeBloc>().dateTime = DateTime.parse(
        widget.arg.finances?.dateTime ?? DateTime.now().toString());
    context.read<IncomeBloc>().nameCate = widget.arg.finances?.cateName ?? '';
    context.read<IncomeBloc>().cateID = widget.arg.finances?.cateID ?? 0;
    context.read<IncomeBloc>().color = widget.arg.finances?.color ?? 0;
    context.read<IncomeBloc>().icon = widget.arg.finances?.icon ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: widget.arg.isUpdate == true
          ? AppBarWidget(text: AppLocalizations.of(context)!.update)
          : null,
      body: ListView(
        children: [
          Column(
            children: [
              // textbox nhập nội dung
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColors.grey, width: 0.5)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(AppLocalizations.of(context)!.date,
                              style: tStyle.medium()),
                        ),
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate:
                                    context.read<IncomeBloc>().dateTime,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2300),
                              );
                              if (picked != null) {
                                setState(() {
                                  context.read<IncomeBloc>().dateTime = picked;
                                });
                              }
                            },
                            child: ButtonSelectDay(
                                text: DateFormat.yMEd().format(
                                    context.read<IncomeBloc>().dateTime)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColors.grey, width: 0.5)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(AppLocalizations.of(context)!.notes,
                                style: tStyle.medium())),
                        Expanded(
                          flex: 5,
                          child: InputSecondary(
                            hintText: AppLocalizations.of(context)!.enterNote,
                            obscureText: false,
                            controller:
                                context.read<IncomeBloc>().noteController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColors.grey, width: 0.5)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(AppLocalizations.of(context)!.money,
                                style: tStyle.medium())),
                        Expanded(
                          flex: 5,
                          child: InputSecondary(
                            hintText: AppLocalizations.of(context)!.enterMoney,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            controller:
                                context.read<IncomeBloc>().moneyController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //lựa chọn danh mục
              BlocBuilder<IncomeBloc, IncomeState>(
                builder: (context, state) {
                  List<Category> cateIncome = state.cateIncome;
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColors.grey, width: 0.5)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.cate,
                                style: tStyle.medium()),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: cateIncome.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      context.read<IncomeBloc>().nameCate =
                                          cateIncome[index].name;
                                      context.read<IncomeBloc>().cateID =
                                          cateIncome[index].cateID;
                                      context.read<IncomeBloc>().color =
                                          cateIncome[index].color;
                                      context.read<IncomeBloc>().icon =
                                          cateIncome[index].icon;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: context
                                                    .read<IncomeBloc>()
                                                    .nameCate !=
                                                cateIncome[index].name
                                            ? Border.all(
                                                color: AppColors.grey, width: 2)
                                            : Border.all(
                                                color: AppColors.themeColor,
                                                width: 2),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          MdiIcons.fromString(
                                              cateIncome[index].icon),
                                          color: Color(cateIncome[index].color),
                                        ),
                                        Text(
                                          cateIncome[index].name,
                                          style: tStyle.mediumRegular(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                },
              ),

              //button
              Container(
                padding: const EdgeInsets.all(16),
                child: ButtonPrimary(
                  textButton: widget.arg.isUpdate == false
                      ? AppLocalizations.of(context)!.submit
                      : AppLocalizations.of(context)!.submit,
                  onTap: () {
                    addAndEditFinanceDetail();
                  },
                ),
              )
            ],
          ),
        ],
      ),
      bottomSheet:
          widget.arg.isUpdate == true ? const BottomSheetButton() : null,
    );
  }

  //nhấn thêm mới
  void addAndEditFinanceDetail() {
    context
        .read<IncomeBloc>()
        .add(IncomeAddAndEditEvent(widget: widget, context: context));
  }
}
