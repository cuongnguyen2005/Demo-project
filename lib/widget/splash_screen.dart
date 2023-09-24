// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:finance_app/source/colors.dart';
import 'package:finance_app/widget/bottom_navigationbar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
        context, Bottom.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Finance',
          style: TextStyle(
              color: maincolor, fontSize: 56, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
