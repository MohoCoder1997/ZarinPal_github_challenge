import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class PersistentStorageHandler {
  final SharedPreferences _sharedPreferences;

  PersistentStorageHandler(this._sharedPreferences);

  Future save({
    required String key,
    required dynamic value,
  }) async {
    switch (value.runtimeType) {
      case String:
        await _sharedPreferences.setString(key, value);
        break;
      case int:
        await _sharedPreferences.setInt(key, value);
        break;
      case double:
        await _sharedPreferences.setDouble(key, value);
        break;
      case bool:
        await _sharedPreferences.setBool(key, value);
        break;
      default:
        _sharedPreferences.setStringList(key, value);
        break;
    }
  }

  load({required String key}) => _sharedPreferences.get(key);
}
