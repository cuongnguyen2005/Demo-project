// ignore_for_file: unused_import

import 'package:finance_app/screen/bottom_navigationbar.dart';
import 'package:finance_app/screen/fiance_detail.dart';
import 'package:finance_app/screen/fix_detail.dart';
import 'package:finance_app/screen/write_finance.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  if (settings.name == FianceDetail.routeName) {
    // final String arg = settings.arguments as String;

    return MaterialPageRoute(builder: (_) => FianceDetail());
  }
  if (settings.name == Bottom.routeName) {
    return MaterialPageRoute(builder: (_) => Bottom());
  }
  if (settings.name == FixDetail.routeName) {
    final String arg = settings.arguments as String;
    return MaterialPageRoute(
      builder: (_) => FixDetail(
        financeModel: arg,
      ),
    );
  }

  return null;
};
