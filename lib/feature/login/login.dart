import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/feature/signup/signup.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/source/utils/validate_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

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
    context.read<LoginBloc>().usernameController.text = widget.userName ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSucessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Bottom.routeName, (route) => false);
        }
        if (state is LoginErrorState) {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                content: AppLocalizations.of(context)!.userNotExist,
                onTap: onTapBack,
              );
            },
          );
        }
        if (state is LoginOnTapBackState) {
          onTapBack();
        }
        if (state is LoginErrorPassState) {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                content: 'Mật khẩu không đúng',
                onTap: onTapBack,
              );
            },
          );
        }
        if (state is LoginErrorUserState) {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                content: 'Tài khoản không tồn tại',
                onTap: onTapBack,
              );
            },
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView(
              children: [
                Form(
                  key: context.read<LoginBloc>().formKey,
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
                        validator: ValidateUntils(ctx: context).validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller:
                            context.read<LoginBloc>().usernameController,
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return InputDefault(
                            hintText: AppLocalizations.of(context)!.pw,
                            obscureText: state.visibility,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                              onTap: onTapVisibility,
                              child: state.visibility == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            validator:
                                ValidateUntils(ctx: context).validatePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: context.read<LoginBloc>().pwController,
                          );
                        },
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
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapVisibility() {
    context.read<LoginBloc>().add(LoginVisibilityEvent());
  }

  void onTapSignup() {
    Navigator.pushNamed(context, SignupPage.routeName);
  }

  void onTapLogin() async {
    if (context.read<LoginBloc>().formKey.currentState!.validate()) {
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
      context.read<LoginBloc>().add(LoginSubmitEvent());
    }
  }
}
