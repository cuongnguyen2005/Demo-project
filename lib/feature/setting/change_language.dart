// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/component/btn/btn_bottom_sheet.dart';
import 'package:finance_app/main.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/language_constant.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});
  static String routeName = 'change_language';

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  List<String> languages = ["Tiếng Việt", "English"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.themeColor,
        title: Center(
          child: Text(AppLocalizations.of(context)!.languageChange,
              style: tStyle.H5()),
        ),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              if (index == 0) {
                Locale locale = await setLocale('vi');
                MyApp.setLocale(context, locale);
              }
              if (index == 1) {
                Locale locale = await setLocale('en');
                MyApp.setLocale(context, locale);
              }
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(languages[index]),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: const BottomSheetButton(),
    );
  }
}
