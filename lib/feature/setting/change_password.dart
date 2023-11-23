// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/btn/button_secondary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/source/utils/validate_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  static String routeName = 'change_pw';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
          child:
              Text(AppLocalizations.of(context)!.changePw, style: tStyle.H5()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 16),
              InputDefault(
                hintText: AppLocalizations.of(context)!.newPw,
                obscureText: visibilityNew,
                suffixIcon: InkWell(
                    onTap: onTapVisibilityNew,
                    child: const Icon(Icons.visibility_off)),
                controller: newPwController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ValidateUntils(ctx: context).validatePassword,
              ),
              const SizedBox(height: 16),
              InputDefault(
                hintText: AppLocalizations.of(context)!.confirmPw,
                obscureText: visibilityConfirm,
                suffixIcon: InkWell(
                    onTap: onTapVisibilityConfirm,
                    child: const Icon(Icons.visibility_off)),
                controller: confirmPwController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateConfirmPassword,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        height: 75,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ButtonSecondary(
                textButton: AppLocalizations.of(context)!.cancel,
                onTap: onTapBack,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: ButtonPrimary(
                textButton: AppLocalizations.of(context)!.update,
                onTap: onTapUpdatePw,
              ),
            ),
          ],
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
    if (formKey.currentState!.validate()) {
      changePassword();
    }
  }

  var curUser = FirebaseAuth.instance.currentUser;

  void changePassword() async {
    try {
      await curUser!.updatePassword(newPwController.text);
      FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  //
  String? validateConfirmPassword(String? value) {
    // return null;
    if (value == newPwController.text) {
      return null;
    } else {
      return AppLocalizations.of(context)!.incorrectPw;
    }
  }
}
