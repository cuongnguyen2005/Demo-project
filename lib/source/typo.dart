// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:finance_app/source/colors.dart';
import 'package:flutter/material.dart';

const tStyle = TextStyle();

extension TextStyle$ on TextStyle {
  TextStyle H1() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: AppColors.blue,
        fontStyle: FontStyle.normal,
      );
  TextStyle H2() => copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppColors.blue,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle H3() => copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle H4() => copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle H5() => copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle H5W() => copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle H5Blue() => copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.blue,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle H6() => copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle mediumBold() => copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle rMediumBold() => copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.red,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle gMediumBold() => copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.green,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle bMediumBold() => copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.blue,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle medium() => copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle mediumRegular() => copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
  TextStyle small() => copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
      );
}
