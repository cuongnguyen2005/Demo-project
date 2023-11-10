// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/data/user_account.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/source/utils/validate_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String routeName = 'Signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool visibility = true;
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .1),
                    InkWell(
                      onTap: onTapBack,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(height: size.height * .1),
                    Text(
                      'Tạo một tài khoản',
                      style: tStyle.H1(),
                    ),
                    const SizedBox(height: 32),
                    InputDefault(
                      hintText: 'Họ và tên',
                      obscureText: false,
                      prefixIcon: const Icon(Icons.person),
                      validator: ValidateUntils.validateName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                    ),
                    const SizedBox(height: 16),
                    InputDefault(
                      hintText: 'Email',
                      obscureText: false,
                      prefixIcon: const Icon(Icons.email),
                      validator: ValidateUntils.validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    InputDefault(
                      hintText: 'Mật khẩu',
                      obscureText: visibility,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                        onTap: onTapVisibility,
                        child: visibility == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      validator: ValidateUntils.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: pwController,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 1,
                          child: ButtonPrimary(
                            textButton: 'ĐĂNG KÝ',
                            onTap: onTapSignup,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColors.lightGrey,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bạn đã có tài khoản? ',
              style: tStyle.H5(),
            ),
            ButtonNoBox(
              textButton: 'Đăng nhập',
              onTap: onTapBack,
            )
          ],
        ),
      ),
    );
  }

  void onTapVisibility() {
    setState(() {
      visibility = !visibility;
    });
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSignup() async {
    if (formKey.currentState!.validate()) {
      //add loading
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.themeColor,
            ));
          });
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text, password: pwController.text);

        createUsertoFireStore();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                  content: 'Email đã tồn tại', onTap: onTapBack);
            },
          );
        }
      }
    }
  }

  createUsertoFireStore() async {
    User? user = FirebaseAuth.instance.currentUser;
    ByteData bytes = await rootBundle.load('assets/images/avatar_white.jpg');
    final ByteBuffer buffer = bytes.buffer;

    UsersAccount userAccount = UsersAccount(
      name: nameController.text,
      userName: user!.email,
      avatar: base64.encode(Uint8List.view(buffer)),
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(userAccount.toMap());
    //remove loading
    onTapBack();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false,
        arguments: usernameController.text);
  }
}
