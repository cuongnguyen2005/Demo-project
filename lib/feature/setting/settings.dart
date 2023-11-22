import 'package:finance_app/component/setting/box_basic_setting.dart';
import 'package:finance_app/feature/category/cate_default/cate_default_tab.dart';
import 'package:finance_app/feature/category/cate_personal/cate_personal_tab.dart';
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
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                BoxBasicSetting(
                  icon: const Icon(Icons.person, color: AppColors.blue),
                  text: AppLocalizations.of(context)!.personalSetting,
                  onTap: onTapSettingPersonal,
                ),
              ],
            ),
          ),

          //Cài đặt cơ bản
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Row(
                    children: [
                      const Icon(Icons.category, color: AppColors.blue),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!.cateManagement,
                          style: tStyle.mediumRegular()),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          BoxBasicSetting(
                            icon: const Icon(Icons.category,
                                color: AppColors.blue),
                            text: AppLocalizations.of(context)!
                                .cateDefaultManagement,
                            onTap: onTapCateDefaultManagement,
                          ),
                          BoxBasicSetting(
                            icon: const Icon(Icons.category,
                                color: AppColors.blue),
                            text: AppLocalizations.of(context)!
                                .catePersonalManagement,
                            onTap: onTapCatePersonalManagement,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                BoxBasicSetting(
                  icon: const Icon(Icons.theater_comedy, color: AppColors.red),
                  text: AppLocalizations.of(context)!.theme,
                  onTap: () {},
                ),
                BoxBasicSetting(
                  icon: const Icon(Icons.language, color: AppColors.green),
                  text: AppLocalizations.of(context)!.languageChange,
                  onTap: onTapChangeLanguage,
                ),
                BoxBasicSetting(
                  icon: const Icon(Icons.info, color: AppColors.orange),
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

  void onTapCateDefaultManagement() {
    Navigator.pushNamed(context, CateDefaultTab.routeName);
  }

  void onTapCatePersonalManagement() {
    Navigator.pushNamed(context, CatePersonalTab.routeName);
  }

  void onTapChangeLanguage() {
    Navigator.pushNamed(context, ChangeLanguage.routeName);
  }
}
