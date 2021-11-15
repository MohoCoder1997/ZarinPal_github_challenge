// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:intl/intl.dart' as _i3;

import 'register_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factoryParam<_i3.DateFormat, String?, dynamic>(
      (pattern, _) => registerModule.dateFormatter(pattern));
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => registerModule.internetChecker);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<String>(() => registerModule.datePattern,
      instanceName: 'DatePattern');
  gh.lazySingleton<_i5.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}
