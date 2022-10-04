import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../App/constants.dart';
import '../../App/shared_preference_helper.dart';
import '../../l10n/l10n.dart';


class LocaleController extends GetxController {
   Rx<Locale?> locale =  Locale('en').obs;

  void setLocale(Locale? locale) {
    if (!L10n.all.contains(locale)) return;
    SharedPreferenceHelper.setString(Constants.languageCode,locale!.languageCode);
    this.locale.value = locale;
  }

  void clearLocale() {
    locale.value = null;
  }
}
