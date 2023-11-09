import 'dart:convert';

import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/btn/button_secondary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  static String routeName = 'change_pw';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldPwController = TextEditingController();
  final newPwController = TextEditingController();
  final confirmPwController = TextEditingController();

  bool visibilityOld = true;
  bool visibilityNew = true;
  bool visibilityConfirm = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text('Thay đổi mật khẩu', style: tStyle.H5()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputDefault(
                hintText: 'Mật khẩu cũ',
                obscureText: visibilityOld,
                suffixIcon: InkWell(
                    onTap: onTapVisibilityOld,
                    child: const Icon(Icons.visibility_off)),
                controller: oldPwController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateOldPassword,
              ),
              const SizedBox(height: 16),
              InputDefault(
                hintText: 'Mật khẩu mới',
                obscureText: visibilityNew,
                suffixIcon: InkWell(
                    onTap: onTapVisibilityNew,
                    child: const Icon(Icons.visibility_off)),
                controller: newPwController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateNewPassword,
              ),
              const SizedBox(height: 16),
              InputDefault(
                hintText: 'Xác nhận mật khẩu',
                obscureText: visibilityConfirm,
                suffixIcon: InkWell(
                    onTap: onTapVisibilityConfirm,
                    child: const Icon(Icons.visibility_off)),
                controller: confirmPwController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateConfirmPassword,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonSecondary(
                      textButton: 'Hủy',
                      onTap: onTapBack,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: ButtonPrimary(
                      textButton: 'Cập nhật',
                      onTap: onTapUpdatePw,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapVisibilityConfirm() {
    setState(() {
      visibilityConfirm = !visibilityConfirm;
    });
  }

  void onTapVisibilityOld() {
    setState(() {
      visibilityOld = !visibilityOld;
    });
  }

  void onTapVisibilityNew() {
    setState(() {
      visibilityNew = !visibilityNew;
    });
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapUpdatePw() {
    if (formKey.currentState!.validate()) {}
  }

  //validate
  String? validateOldPassword(String? value) {
    // return null;
    if ((value ?? '').isEmpty) return 'Mật khẩu không được để trống';

    // String pw = widget.user.password;
    // List<int> bytes = utf8.encode(value ?? '');
    // if (md5.convert(bytes).toString() == pw) {
    //   return null;
    // } else {
    //   return "Mật khẩu không đúng";
    // }
  }

  //validate
  String? validateNewPassword(String? value) {
    if ((value ?? '').isEmpty) return 'Mật khẩu không được để trống';

    // String pw = widget.user.password;
    // List<int> bytes = utf8.encode(value ?? '');
    // if (md5.convert(bytes).toString() == pw) {
    //   return "Mật khẩu trùng mật khẩu cũ";
    // }
    // RegExp pwRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    // if (pwRegexp.hasMatch(value ?? "")) {
    //   return null;
    // } else {
    //   return "Mật khẩu phải gồm 6 kí tự, 1 in hoa, in thường và số";
    // }
  }

  //
  String? validateConfirmPassword(String? value) {
    // return null;
    if (value == newPwController.text) {
      return null;
    } else {
      return "Mật khẩu không khớp";
    }
  }
}
