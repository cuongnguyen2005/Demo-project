// ignore_for_file: unused_import

import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/feature/fiance_detail.dart';
import 'package:finance_app/feature/finances/finance_navigator.dart';
import 'package:finance_app/feature/intro/splash_screen.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/feature/setting/change_password.dart';
import 'package:finance_app/feature/signup/signup.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  if (settings.name == SplashScreen.routeName) {
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }
  if (settings.name == LoginPage.routeName) {
    final String arg = settings.arguments as String;
    return MaterialPageRoute(
        builder: (_) => LoginPage(
              userName: arg,
            ));
  }
  if (settings.name == SignupPage.routeName) {
    return MaterialPageRoute(builder: (_) => SignupPage());
  }
  if (settings.name == FinanceDetail.routeName) {
    // final String arg = settings.arguments as String;

    return MaterialPageRoute(builder: (_) => FinanceDetail());
  }
  if (settings.name == Bottom.routeName) {
    return MaterialPageRoute(builder: (_) => Bottom());
  }
  if (settings.name == ChangePassword.routeName) {
    return MaterialPageRoute(builder: (_) => ChangePassword());
  }

  return null;
};
