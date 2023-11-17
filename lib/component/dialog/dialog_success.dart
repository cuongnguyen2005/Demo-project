// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_app/source/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      title:
          const Icon(Icons.check_circle, size: 50, color: AppColors.themeColor),
      content: Text(AppLocalizations.of(context)!.success,
          textAlign: TextAlign.center),
    );
  }
}
