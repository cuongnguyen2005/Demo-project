import 'package:finance_app/routes.dart';
import 'package:finance_app/widget/bottomnavigationbar.dart';
import 'package:finance_app/widget/home.dart';
import 'package:finance_app/widget/writefiance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 248, 248, 248)),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      home: Bottom(),
    );
  }
}
