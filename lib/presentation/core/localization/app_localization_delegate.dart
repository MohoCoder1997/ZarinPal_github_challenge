
import 'package:flutter/material.dart';
import 'package:github_challenge/injection_container/injection.dart';
import 'package:injectable/injectable.dart';



import 'app_localizations.dart';

@injectable
class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {

      const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fa'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale)async {
     AppLocalizations localizations = sl<AppLocalizations>(param1: locale);
     await localizations.load();
     return localizations;

  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}