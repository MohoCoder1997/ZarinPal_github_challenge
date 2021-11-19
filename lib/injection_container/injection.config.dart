// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:intl/intl.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../application/auth/bloc/auth_bloc.dart' as _i19;
import '../application/repo/bloc/repo_bloc.dart' as _i16;
import '../application/setting/bloc/setting_bloc.dart' as _i13;
import '../application/user/bloc/user_bloc.dart' as _i18;
import '../core/persistent_storage_handler.dart' as _i12;
import '../core/url_luncher.dart' as _i9;
import '../domain/repository/i_repository.dart' as _i17;
import '../infrastructure/core/api_call_handler.dart' as _i14;
import '../infrastructure/core/connection_checker.dart' as _i10;
import '../infrastructure/datasources/remote_data_source.dart' as _i15;
import '../infrastructure/repository/repository_impl.dart' as _i20;
import '../presentation/core/localization/app_localization_delegate.dart'
    as _i5;
import '../presentation/core/localization/app_localizations.dart' as _i3;
import 'register_module.dart' as _i21; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<String>(() => registerModule.baseUrlForLogin,
      instanceName: 'BaseUrlForLogin');
  gh.factory<String>(() => registerModule.datePattern,
      instanceName: 'DatePattern');
  gh.factory<_i9.UrlLuncher>(() => _i9.UrlLuncher());
  gh.lazySingleton<_i10.ConnectionChecker>(
      () => _i10.ConnectionChecker(get<_i7.InternetConnectionChecker>()));
  gh.lazySingleton<_i11.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i12.PersistentStorageHandler>(
      () => _i12.PersistentStorageHandler(get<_i8.SharedPreferences>()));
  gh.factory<_i13.SettingBloc>(
      () => _i13.SettingBloc(get<_i12.PersistentStorageHandler>()));
  gh.lazySingleton<_i14.ApiCallHandler>(
      () => _i14.ApiCallHandler(get<_i11.Dio>()));
  gh.factory<_i15.RemoteDataSource>(
      () => _i15.RemoteDataSource(get<_i14.ApiCallHandler>()));
  gh.factory<_i16.RepoBloc>(() => _i16.RepoBloc(get<_i17.IRepository>()));
  gh.factory<_i18.UserBloc>(() => _i18.UserBloc(get<_i17.IRepository>()));
  gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(get<_i17.IRepository>(),
      get<_i12.PersistentStorageHandler>(), get<_i9.UrlLuncher>()));
  gh.singleton<_i17.IRepository>(_i20.RepositoryImpl(
      get<_i15.RemoteDataSource>(), get<_i10.ConnectionChecker>()));
  return get;
}

class _$RegisterModule extends _i21.RegisterModule {}
