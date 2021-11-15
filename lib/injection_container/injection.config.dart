// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:intl/intl.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../application/setting/bloc/setting_bloc.dart' as _i10;
import '../presentation/core/localization/app_localization_delegate.dart'
    as _i5;
import '../presentation/core/localization/app_localizations.dart' as _i3;
import 'register_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factoryParam<_i3.AppLocalizations, _i4.Locale?, dynamic>(
      (locale, _) => _i3.AppLocalizations(locale));
  gh.factory<_i5.AppLocalizationsDelegate>(
      () => _i5.AppLocalizationsDelegate());
  gh.factoryParam<_i6.DateFormat, String?, dynamic>(
      (pattern, _) => registerModule.dateFormatter(pattern));
  gh.lazySingleton<_i7.InternetConnectionChecker>(
      () => registerModule.internetChecker);
  await gh.factoryAsync<_i8.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<String>(() => registerModule.datePattern,
      instanceName: 'DatePattern');
  gh.lazySingleton<_i9.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i10.SettingBloc>(
      () => _i10.SettingBloc(get<_i8.SharedPreferences>()));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
