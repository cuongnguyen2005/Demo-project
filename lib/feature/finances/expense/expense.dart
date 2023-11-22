import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/component/btn/btn_select_day.dart';
import 'package:finance_app/component/form_field/input_secondary.dart';
import 'package:finance_app/data/category.dart';
import 'package:finance_app/data/finance.dart';
import 'package:finance_app/feature/finances/expense/bloc/expense_bloc.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bloc/expense_event.dart';
import 'bloc/expense_state.dart';

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
    context.read<ExpenseBloc>().add(ExpenseGetCateEvent(context: context));
    context.read<ExpenseBloc>().noteController.text =
        widget.arg.finances?.note ?? '';
    context.read<ExpenseBloc>().moneyController.text =
        widget.arg.finances?.money.toString() ?? '';
    context.read<ExpenseBloc>().dateTime = DateTime.parse(
        widget.arg.finances?.dateTime ?? DateTime.now().toString());
    context.read<ExpenseBloc>().nameCate = widget.arg.finances?.cateName ?? '';
    context.read<ExpenseBloc>().cateID = widget.arg.finances?.cateID ?? 0;
    context.read<ExpenseBloc>().color = widget.arg.finances?.color ?? 0;
    context.read<ExpenseBloc>().icon = widget.arg.finances?.icon ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: widget.arg.isUpdate == true
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.themeColor,
              title: Center(
                child: Text(AppLocalizations.of(context)!.update,
                    style: tStyle.H5()),
              ),
            )
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
                                      context.read<ExpenseBloc>().dateTime,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2300),
                                );
                                if (picked != null) {
                                  setState(() {
                                    context.read<ExpenseBloc>().dateTime =
                                        picked;
                                  });
                                }
                              },
                              child: ButtonSelectDay(
                                  text: DateFormat.yMEd().format(
                                      context.read<ExpenseBloc>().dateTime))),
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
                                context.read<ExpenseBloc>().noteController,
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
                                context.read<ExpenseBloc>().moneyController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //lựa chọn danh mục
              BlocBuilder<ExpenseBloc, ExpenseState>(
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
                                      context.read<ExpenseBloc>().nameCate =
                                          cateExpense[index].name;
                                      context.read<ExpenseBloc>().cateID =
                                          cateExpense[index].cateID;
                                      context.read<ExpenseBloc>().color =
                                          cateExpense[index].color;
                                      context.read<ExpenseBloc>().icon =
                                          cateExpense[index].icon;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: context
                                                    .read<ExpenseBloc>()
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
        .read<ExpenseBloc>()
        .add(ExpenseAddAndEditEvent(widget: widget, context: context));
  }
}
