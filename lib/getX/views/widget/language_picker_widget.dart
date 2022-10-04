import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../l10n/l10n.dart';
import '../../controllers/locale_controller.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController _localController = Get.find();
    return GetX<LocaleController>(
        builder: (LocaleController localController)=>DropdownButtonHideUnderline(
        child:DropdownButton(
            value: localController.locale.value ?? Locale('en'),
            icon: Container(width: 12),
            items: L10n.all.map(
              (locale) {
                final flag = L10n.getFlag(locale.languageCode);

                return DropdownMenuItem(
                  child: Center(
                    child: Text(
                      flag,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  value: locale,
                  onTap: () {
                    _localController.setLocale(locale);
                  },
                );
              },
            ).toList(),
            onChanged: (_) {},
          ),
       // ),
      ),
    );
  }
}
