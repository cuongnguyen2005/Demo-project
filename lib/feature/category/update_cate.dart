// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:finance_app/data/category.dart';
import 'package:finance_app/source/finances_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';

class UpdateCate extends StatefulWidget {
  const UpdateCate({
    Key? key,
    this.expense,
  }) : super(key: key);
  final Category? expense;
  static String routeName = 'update_expense_cate';

  @override
  State<UpdateCate> createState() => _UpdateCateState();
}

class _UpdateCateState extends State<UpdateCate> {
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
    nameCateController.text = widget.expense?.name ?? '';
    nameCate = widget.expense?.cateName ?? '';
    cateID = widget.expense?.cateID ?? 0;
  }

  User? user;
  List<String> catesName = ['Khoản thu', 'Khoản chi'];
  final TextEditingController nameCateController = TextEditingController();
  String nameCate = '';
  int cateID = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text('Thêm mới', style: tStyle.H5()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputDefault(
              hintText: 'tên danh mục',
              obscureText: false,
              controller: nameCateController,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: catesName.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          nameCate = catesName[index];
                          if (catesName[index] == 'Khoản thu') {
                            cateID = 1;
                          }
                          if (catesName[index] == 'Khoản chi') {
                            cateID = 2;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: nameCate != catesName[index]
                                ? Border.all(color: AppColors.grey, width: 2)
                                : Border.all(
                                    color: AppColors.themeColor, width: 2),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          catesName[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 16),
            ButtonPrimary(
              textButton: widget.expense == null ? 'Thêm' : 'Chỉnh sửa',
              onTap: () => widget.expense == null
                  ? onTapAddCate(cateID, nameCate)
                  : onTapUpdateCate(cateID, widget.expense?.id ?? '', nameCate),
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
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void onTapAddCate(int cateID, String cateName) async {
    if (nameCateController.text.isNotEmpty) {
      if (cateName.isNotEmpty) {
        showSuccess();
        await FinanceRepo.addCateById(
            user!.uid, cateID, cateName, nameCateController.text);
        Navigator.of(context)
          ..pop()
          ..pop();
      }
    }
  }

  void onTapUpdateCate(int cateID, String id, String cateName) async {
    if (nameCateController.text.isNotEmpty) {
      if (cateName.isNotEmpty) {
        showSuccess();
        await FinanceRepo.updateCateById(
            user!.uid, id, cateID, cateName, nameCateController.text);
        Navigator.of(context)
          ..pop()
          ..pop();
      }
    }
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title:
              Icon(Icons.check_circle, size: 50, color: AppColors.themeColor),
          content: Text('Thành công', textAlign: TextAlign.center),
        );
      },
    );
  }
}
