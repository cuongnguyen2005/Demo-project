// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/screen/bottom_navigationbar.dart';
import 'package:finance_app/screen/signup/signup.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/source/utils/validate_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.userName,
  }) : super(key: key);
  static String routeName = 'Login_page';
  final String? userName;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    usernameController.text = widget.userName ?? '';
    super.initState();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool visibility = true;
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
                    SizedBox(height: size.height * .2),
                    Text(
                      'Login',
                      style: tStyle.H1(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please sign in to continue.',
                      style: tStyle.H6(),
                    ),
                    const SizedBox(height: 32),
                    InputDefault(
                      hintText: 'email',
                      obscureText: false,
                      prefixIcon: const Icon(Icons.email),
                      validator: ValidateUntils.validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    InputDefault(
                      hintText: 'password',
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
                            textButton: 'LOGIN',
                            onTap: onTapLogin,
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
              'Dont have an account? ',
              style: tStyle.H5(),
            ),
            ButtonNoBox(
              textButton: 'Sign up',
              onTap: onTapSignup,
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

  void onTapSignup() {
    Navigator.pushNamed(context, SignupPage.routeName);
  }

  void onTapLogin() {
    if (formKey.currentState!.validate()) {
      auth
          .signInWithEmailAndPassword(
              email: usernameController.text, password: pwController.text)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, Bottom.routeName, (route) => false);
      }).catchError((onError) {});
    }
  }
}
