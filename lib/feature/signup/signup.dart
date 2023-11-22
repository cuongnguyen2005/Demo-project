import 'package:finance_app/component/btn/button_no_box.dart';
import 'package:finance_app/component/btn/button_primary.dart';
import 'package:finance_app/component/dialog/dialog_primary.dart';
import 'package:finance_app/component/form_field/input_default.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/feature/signup/bloc/signup_bloc.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:finance_app/source/utils/validate_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String routeName = 'Signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          onTapBack();
          Navigator.pushNamedAndRemoveUntil(
              context, LoginPage.routeName, (route) => false,
              arguments: context.read<SignupBloc>().usernameController.text);
        }
        if (state is SignupErrorUserState) {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                  content: AppLocalizations.of(context)!.emailUsed,
                  onTap: onTapBack);
            },
          );
        }
        if (state is SignupErrorNetworkState) {
          //remove loading
          onTapBack();
          showDialog(
            context: context,
            builder: (context) {
              return DialogPrimary(
                  content: 'Lỗi kết nối mạng', onTap: onTapBack);
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
                  key: context.read<SignupBloc>().formKey,
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
                        AppLocalizations.of(context)!.titleSignup,
                        style: tStyle.H1(),
                      ),
                      const SizedBox(height: 32),
                      InputDefault(
                        hintText: AppLocalizations.of(context)!.name,
                        obscureText: false,
                        prefixIcon: const Icon(Icons.person),
                        validator: ValidateUntils.validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: context.read<SignupBloc>().nameController,
                      ),
                      const SizedBox(height: 16),
                      InputDefault(
                        hintText: AppLocalizations.of(context)!.email,
                        obscureText: false,
                        prefixIcon: const Icon(Icons.email),
                        validator: ValidateUntils.validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller:
                            context.read<SignupBloc>().usernameController,
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SignupBloc, SignupState>(
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
                            validator: ValidateUntils.validatePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: context.read<SignupBloc>().pwController,
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
                              textButton: AppLocalizations.of(context)!.signup,
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
                AppLocalizations.of(context)!.titleSignup2,
                style: tStyle.H5(),
              ),
              ButtonNoBox(
                textButton: AppLocalizations.of(context)!.login,
                onTap: onTapBack,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTapVisibility() {
    context.read<SignupBloc>().add(SignupVisibilityEvent());
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSignup() async {
    if (context.read<SignupBloc>().formKey.currentState!.validate()) {
      // add loading
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.themeColor,
            ));
          });
      context.read<SignupBloc>().add(SignupSubmitEvent());
    }
  }
}
