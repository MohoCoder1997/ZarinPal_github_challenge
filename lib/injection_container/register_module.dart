import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

@module
abstract class RegisterModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://api.github.com/';

  @Named('DatePattern')
  String get datePattern => 'YYYY-MM-DDTHH:MM:SSZ';

  @LazySingleton()
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @LazySingleton()
  InternetConnectionChecker get internetChecker => InternetConnectionChecker();

  @injectable
  DateFormat dateFormatter(@factoryParam String? pattern) =>
      DateFormat(pattern);
}
