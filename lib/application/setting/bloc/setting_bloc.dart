import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_challenge/presentation/core/app_themes.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SharedPreferences sp;

  SettingBloc(this.sp)
      : super(
          SettingState(
            themeData: sp.getInt('theme') != null
                ? appThemeData[AppTheme.values[sp.getInt('theme')!]]
                : appThemeData[AppTheme.Light],
            locale: sp.getString('locale') != null
                ? Locale(sp.getString('locale')!)
                : null,
          ),
        );

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is SettingChangedTheme) {
      sp.setInt('theme', event.appTheme!.index);
      yield SettingState(
        locale: state.locale,
        themeData: appThemeData[AppTheme.values[sp.getInt('theme')!]],
      );
    }
    if (event is SettingChangedLocale) {
      await sp.setString('locale', event.locale!.languageCode);
      yield new SettingState(
        locale: event.locale,
        themeData: state.themeData,
      );
    }
  }
}
