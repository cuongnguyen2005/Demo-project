// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/feature/bottom_navigationbar.dart';
import 'package:finance_app/feature/login/login.dart';
import 'package:finance_app/source/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    checkLogin();
  }

  bool isLogged = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  void checkLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogged = true;
        });
      }
    });
  }

  _navigatortohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    isLogged == false
        ? Navigator.pushNamedAndRemoveUntil(
            context, LoginPage.routeName, (route) => false)
        : Navigator.pushNamedAndRemoveUntil(
            context, Bottom.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
