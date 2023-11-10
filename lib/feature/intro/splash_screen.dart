// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/source/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }

  _navigatortohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Finance',
          style: TextStyle(
              color: AppColors.themeColor,
              fontSize: 56,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
