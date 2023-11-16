// ignore_for_file: unused_import

import 'package:finance_app/data/category.dart';
import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/feature/category/cate_navi.dart';
import 'package:finance_app/feature/category/update_cate.dart';
import 'package:finance_app/feature/finance-detail.dart';
import 'package:finance_app/feature/finances/expense.dart';
import 'package:finance_app/feature/finances/finance_navigator.dart';
import 'package:finance_app/feature/finances/income.dart';
import 'package:finance_app/feature/intro/splash_screen.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/feature/setting/change_password.dart';
import 'package:finance_app/feature/setting/settings_personal.dart';
import 'package:finance_app/feature/signup/signup.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  if (settings.name == SplashScreen.routeName) {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
  if (settings.name == LoginPage.routeName) {
    final String? arg = settings.arguments as String?;
    return MaterialPageRoute(
        builder: (_) => LoginPage(
              userName: arg,
            ));
  }
  if (settings.name == SignupPage.routeName) {
    return MaterialPageRoute(builder: (_) => const SignupPage());
  }

  if (settings.name == FinanceDetail.routeName) {
    return MaterialPageRoute(builder: (_) => const FinanceDetail());
  }
  if (settings.name == Bottom.routeName) {
    final bool? arg = settings.arguments as bool?;
    return MaterialPageRoute(
        builder: (_) => Bottom(
              isUpdate: arg,
            ));
  }
  if (settings.name == ChangePassword.routeName) {
    return MaterialPageRoute(builder: (_) => const ChangePassword());
  }
  if (settings.name == IncomePage.routeName) {
    final IncomePageArg arg = settings.arguments as IncomePageArg;
    return MaterialPageRoute(
        builder: (_) => IncomePage(
              arg: arg,
            ));
  }
  if (settings.name == ExpensePage.routeName) {
    final ExpensePageArg arg = settings.arguments as ExpensePageArg;
    return MaterialPageRoute(
        builder: (_) => ExpensePage(
              arg: arg,
            ));
  }
  if (settings.name == CateNavi.routeName) {
    return MaterialPageRoute(builder: (_) => const CateNavi());
  }
  if (settings.name == UpdateCate.routeName) {
    final Category? arg = settings.arguments as Category?;
    return MaterialPageRoute(
        builder: (_) => UpdateCate(
              expense: arg,
            ));
  }
  if (settings.name == SettingsPersonal.routeName) {
    return MaterialPageRoute(builder: (_) => const SettingsPersonal());
  }

  return null;
};
