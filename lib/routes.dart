// ignore_for_file: unused_import

import 'package:finance_app/screen/bottom_navigationbar.dart';
import 'package:finance_app/screen/fiance_detail.dart';
import 'package:finance_app/screen/income_expense/write_finance.dart';
import 'package:finance_app/screen/intro/splash_screen.dart';
import 'package:finance_app/screen/login/login.dart';
import 'package:finance_app/screen/signup/signup.dart';
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
  if (settings.name == FianceDetail.routeName) {
    // final String arg = settings.arguments as String;

    return MaterialPageRoute(builder: (_) => FianceDetail());
  }
  if (settings.name == Bottom.routeName) {
    return MaterialPageRoute(builder: (_) => Bottom());
  }

  return null;
};
