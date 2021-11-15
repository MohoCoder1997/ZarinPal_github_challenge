import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_challenge/injection_container/injection.dart';
import 'package:injectable/injectable.dart';


import 'app_localization_delegate.dart';


@injectable
class AppLocalizations {
  final Locale? locale;
  Map<String, String>? _localizedStrings;


  static LocalizationsDelegate<AppLocalizations> delegate =
      sl<AppLocalizationsDelegate>();

      

  AppLocalizations(@factoryParam this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'lib/presentation/core/localization/lang/${locale!.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedStrings![key]!;
  }

  static Locale resolationFallBack(locale, supportedLocales) {

    if (locale == null) {
      return supportedLocales.first;
    }
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  }
}
