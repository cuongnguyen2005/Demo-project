// ignore_for_file: prefer_const_constructors

import 'package:finance_app/routes.dart';
import 'package:finance_app/screen/bottom_navigationbar.dart';
import 'package:finance_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
        // fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Color.fromARGB(255, 248, 248, 248),
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      home: SplashScreen(),
    );
  }
}
