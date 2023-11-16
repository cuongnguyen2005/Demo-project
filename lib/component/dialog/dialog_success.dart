// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_app/source/colors.dart';
import 'package:flutter/material.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      title: Icon(Icons.check_circle, size: 50, color: AppColors.themeColor),
      content: Text('Thành công', textAlign: TextAlign.center),
    );
  }
}
