import 'package:finance_app/component/app_bar/app_bar_primary.dart';
import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/btn_select_day.dart';
import 'package:finance_app/component/form_field/input_secondary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/feature/finances/bloc/finances_bloc.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bloc/finances_event.dart';
import 'bloc/finances_state.dart';

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
    context.read<FinancesBloc>().add(FinancesGetCateEvent(context: context));
    context.read<FinancesBloc>().noteController.text =
        widget.arg.finances?.note ?? '';
    context.read<FinancesBloc>().moneyController.text =
        widget.arg.finances?.money.toString() ?? '';
    context.read<FinancesBloc>().dateTime = DateTime.parse(
        widget.arg.finances?.dateTime ?? DateTime.now().toString());
    context.read<FinancesBloc>().nameCate = widget.arg.finances?.cateName ?? '';
    context.read<FinancesBloc>().cateID = widget.arg.finances?.cateID ?? 0;
    context.read<FinancesBloc>().color = widget.arg.finances?.color ?? 0;
    context.read<FinancesBloc>().icon = widget.arg.finances?.icon ?? '';
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
                                      context.read<FinancesBloc>().dateTime,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2300),
                                );
                                if (picked != null) {
                                  setState(() {
                                    context.read<FinancesBloc>().dateTime =
                                        picked;
                                  });
                                }
                              },
                              child: ButtonSelectDay(
                                  text: DateFormat.yMEd().format(
                                      context.read<FinancesBloc>().dateTime))),
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
                                context.read<FinancesBloc>().noteController,
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
                                context.read<FinancesBloc>().moneyController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //lựa chọn danh mục
              BlocBuilder<FinancesBloc, FinancesState>(
                builder: (context, state) {
                  List<Category> cateExpense = state.cateExpense;
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
                              itemCount: cateExpense.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      context.read<FinancesBloc>().nameCate =
                                          cateExpense[index].name;
                                      context.read<FinancesBloc>().cateID =
                                          cateExpense[index].cateID;
                                      context.read<FinancesBloc>().color =
                                          cateExpense[index].color;
                                      context.read<FinancesBloc>().icon =
                                          cateExpense[index].icon;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: context
                                                    .read<FinancesBloc>()
                                                    .nameCate !=
                                                cateExpense[index].name
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
                                              cateExpense[index].icon),
                                          color:
                                              Color(cateExpense[index].color),
                                        ),
                                        Text(
                                          cateExpense[index].name,
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
                      : AppLocalizations.of(context)!.update,
                  onTap: () {
                    addFinanceDetail();
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

  void addFinanceDetail() {
    context
        .read<FinancesBloc>()
        .add(FinancesAddAndEditExpenseEvent(widget: widget, context: context));
  }
}