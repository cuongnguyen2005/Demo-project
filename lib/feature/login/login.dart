// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/feature/signup/signup.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/source/utils/validate_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
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
                      AppLocalizations.of(context)!.login,
                      style: tStyle.H1(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.titleLogin,
                      style: tStyle.H6(),
                    ),
                    const SizedBox(height: 32),
                    InputDefault(
                      hintText: AppLocalizations.of(context)!.email,
                      obscureText: false,
                      prefixIcon: const Icon(Icons.email),
                      validator: ValidateUntils.validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    InputDefault(
                      hintText: AppLocalizations.of(context)!.pw,
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
                            textButton: AppLocalizations.of(context)!.login,
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
              AppLocalizations.of(context)!.titleLogin2,
              style: tStyle.H5(),
            ),
            ButtonNoBox(
              textButton: AppLocalizations.of(context)!.signup,
              onTap: onTapSignup,
            )
          ],
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapVisibility() {
    setState(() {
      visibility = !visibility;
    });
  }

  void onTapSignup() {
    Navigator.pushNamed(context, SignupPage.routeName);
  }

  void onTapLogin() async {
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
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: usernameController.text, password: pwController.text);
        if (user.user != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, Bottom.routeName, (route) => false);
        } else {
          onTapBack();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                content: 'Tài khoản không tồn tại hoặc mật khẩu không đúng',
                onTap: onTapBack,
              );
            },
          );
        }
        // if (e.code == 'wrong-password') {
        //   //remove loading
        //   onTapBack();
        //   showDialog(
        //     context: context,
        //     builder: (context) {
        //       return DialogPrimary(
        //         content: 'Mật khẩu không đúng',
        //         onTap: onTapBack,
        //       );
        //     },
        //   );
        // }
        // if (e.code == 'user-not-found') {
        //   //remove loading
        //   onTapBack();
        //   showDialog(
        //     context: context,
        //     builder: (context) {
        //       return DialogPrimary(
        //         content: 'Tài khoản không tồn tại',
        //         onTap: onTapBack,
        //       );
        //     },
        //   );
        // }
      }
      // on PlatformException catch (e) {
      //   print("lỗi ${e.code}");
      // }
      // catch (e) {
      //   print(e.hashCode);
      // }
    }
  }
}
