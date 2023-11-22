// ignore_for_file: unused_import

import 'package:finance_app/data/category.dart';
import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/feature/category/cate_default/income/bloc/cate_income_default_bloc.dart';
import 'package:finance_app/feature/category/cate_personal/expense/bloc/cate_expense_personal_bloc.dart';
import 'package:finance_app/feature/category/cate_personal/cate_personal_tab.dart';
import 'package:finance_app/feature/category/add_update_cate.dart';
import 'package:finance_app/feature/finance_detail/finance_detail.dart';
import 'package:finance_app/feature/finances/expense/bloc/expense_bloc.dart';
import 'package:finance_app/feature/finances/expense/expense.dart';
import 'package:finance_app/feature/finances/finance_tab.dart';
import 'package:finance_app/feature/finances/income/income.dart';
import 'package:finance_app/feature/intro/splash_screen.dart';
import 'package:finance_app/feature/login/bloc/login_bloc.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/feature/setting/change_language.dart';
import 'package:finance_app/feature/setting/change_password.dart';
import 'package:finance_app/feature/setting/settings_personal.dart';
import 'package:finance_app/feature/signup/bloc/signup_bloc.dart';
import 'package:finance_app/feature/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/category/cate_default/cate_default_tab.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  if (settings.name == SplashScreen.routeName) {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
  if (settings.name == LoginPage.routeName) {
    final arg = settings.arguments as String?;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => LoginBloc(),
              child: LoginPage(
                userName: arg,
              ),
            ));
  }
  if (settings.name == SignupPage.routeName) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => SignupBloc(),
              child: const SignupPage(),
            ));
  }

  if (settings.name == FinanceDetail.routeName) {
    return MaterialPageRoute(builder: (_) => const FinanceDetail());
  }
  if (settings.name == Bottom.routeName) {
    final arg = settings.arguments as bool?;
    return MaterialPageRoute(
        builder: (_) => Bottom(
              isUpdate: arg,
            ));
  }
  if (settings.name == ChangePassword.routeName) {
    return MaterialPageRoute(builder: (_) => const ChangePassword());
  }
  if (settings.name == IncomePage.routeName) {
    final arg = settings.arguments as IncomePageArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => ExpenseBloc(),
              child: IncomePage(
                arg: arg,
              ),
            ));
  }
  if (settings.name == ExpensePage.routeName) {
    final arg = settings.arguments as ExpensePageArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => ExpenseBloc(),
              child: ExpensePage(
                arg: arg,
              ),
            ));
  }
  if (settings.name == CatePersonalTab.routeName) {
    return MaterialPageRoute(builder: (_) => const CatePersonalTab());
  }
  if (settings.name == CateDefaultTab.routeName) {
    return MaterialPageRoute(builder: (_) => const CateDefaultTab());
  }
  if (settings.name == AddAndUpdateCate.routeName) {
    final arg = settings.arguments as AddAndUpdateCateArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => CateExpensePersonalBloc(),
              child: AddAndUpdateCate(
                arg: arg,
              ),
            ));
  }
  if (settings.name == SettingsPersonal.routeName) {
    return MaterialPageRoute(builder: (_) => const SettingsPersonal());
  }
  if (settings.name == ChangeLanguage.routeName) {
    return MaterialPageRoute(builder: (_) => const ChangeLanguage());
  }

  return null;
};
