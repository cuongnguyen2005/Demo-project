import 'package:finance_app/component/setting/box_basic_setting.dart';
import 'package:finance_app/feature/category/cate_navi.dart';
import 'package:finance_app/feature/setting/change_language.dart';
import 'package:finance_app/feature/setting/settings_personal.dart';
import 'package:finance_app/source/colors.dart';
import 'package:finance_app/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Center(
          child:
              Text(AppLocalizations.of(context)!.settings, style: tStyle.H5()),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                BoxBasicSetting(
                  text: AppLocalizations.of(context)!.personalSetting,
                  onTap: onTapSettingPersonal,
                ),
              ],
            ),
          ),

          //Cài đặt cơ bản
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                BoxBasicSetting(
                  text: AppLocalizations.of(context)!.cateManagement,
                  onTap: onTapCateManagement,
                ),
                BoxBasicSetting(
                  text: AppLocalizations.of(context)!.theme,
                  onTap: () {},
                ),
                BoxBasicSetting(
                  text: AppLocalizations.of(context)!.languageChange,
                  onTap: onTapChangeLanguage,
                ),
                BoxBasicSetting(
                  text: AppLocalizations.of(context)!.appInf,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void onTapSettingPersonal() {
    Navigator.pushNamed(context, SettingsPersonal.routeName);
  }

  void onTapCateManagement() {
    Navigator.pushNamed(context, CateNavi.routeName);
  }

  void onTapChangeLanguage() {
    Navigator.pushNamed(context, ChangeLanguage.routeName);
  }
}
