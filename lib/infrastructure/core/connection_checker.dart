import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@LazySingleton()
class ConnectionChecker {
  final InternetConnectionChecker connectionChecker;

  ConnectionChecker(
    this.connectionChecker,
  );
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
