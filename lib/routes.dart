import 'package:finance_app/widget/fianceDetail.dart';
import 'package:finance_app/widget/writefiance.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  if (settings.name == FianceDetail.routeName) {
    final String arg = settings.arguments as String;

    return MaterialPageRoute(builder: (_) => FianceDetail());
  }

  return null;
};
