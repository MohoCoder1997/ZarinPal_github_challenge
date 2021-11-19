import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_challenge/core/persistent_storage_handler.dart';
import 'package:github_challenge/presentation/core/app_themes.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {

  final PersistentStorageHandler _storageHandler;

  SettingBloc(this._storageHandler)
      : super(
          SettingState(
            themeData: _storageHandler.load(key: 'theme') != null
                ? appThemeData[
                    AppTheme.values[_storageHandler.load(key: 'theme')!]]
                : appThemeData[AppTheme.Light],
            locale: _storageHandler.load(key: 'locale') != null
                ? Locale(_storageHandler.load(key: 'locale')!)
                : null,
          ),
        );

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is SettingChangedTheme) {
      await _storageHandler.save(key: 'theme', value: event.appTheme!.index);
      yield SettingState(
        locale: state.locale,
        themeData:
            appThemeData[AppTheme.values[_storageHandler.load(key: 'theme')!]],
      );
    }
    if (event is SettingChangedLocale) {
      await _storageHandler.save(
          key: 'locale', value: event.locale!.languageCode);
      yield new SettingState(
        locale: event.locale,
        themeData: state.themeData,
      );
    }
  }
}
