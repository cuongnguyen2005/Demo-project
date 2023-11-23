// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ValidateUntils {
  final BuildContext ctx;
  ValidateUntils({
    required this.ctx,
  });
  //validate email
  String? validateEmail(String? value) {
    // return null;
    if ((value ?? "").isEmpty) return AppLocalizations.of(ctx)!.userNull;
    RegExp emailRegexp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    // RegExp phoneRegexp = RegExp(r'^(03|05|07|08|09)+([0-9]{8})$');
    if (emailRegexp.hasMatch(value ?? "")) {
      return null;
    } else {
      return AppLocalizations.of(ctx)!.userInvalid;
    }
  }

  //Validate mật khẩu
  String? validatePassword(String? value) {
    // return null;
    if ((value ?? "").isEmpty) return AppLocalizations.of(ctx)!.userNull;
    RegExp pwRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    if (pwRegexp.hasMatch(value ?? "")) {
      return null;
    } else {
      return AppLocalizations.of(ctx)!.pwInvalid;
    }
  }

  //Validate name
  String? validateName(String? value) {
    // return null;
    if ((value ?? "").isEmpty) return AppLocalizations.of(ctx)!.userNull;
    return null;
  }
}
