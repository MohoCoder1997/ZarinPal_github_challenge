import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named('BaseUrl')
  String get baseUrl => 'https://api.github.com/';

    @Named('BaseUrlForLogin')
  String get baseUrlForLogin => 'https://github.com/';

  @Named('DatePattern')
  String get datePattern => 'yyyy-MM-ddTHH:mm:ssZ';

  @LazySingleton()
  Dio dio(@Named('BaseUrl') String url) =>
      Dio(BaseOptions(baseUrl:  url));

  @LazySingleton()
  InternetConnectionChecker get internetChecker => InternetConnectionChecker();

  @injectable
  DateFormat dateFormatter(@factoryParam String? pattern) =>
      DateFormat(pattern);
}
