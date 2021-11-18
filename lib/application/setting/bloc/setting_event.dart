part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
}

class SettingChangedTheme extends SettingEvent {
  final AppTheme? appTheme;

  const SettingChangedTheme({
    @required this.appTheme,
  });
  @override
  List<Object?> get props => [appTheme];
}

class SettingChangedLocale extends SettingEvent {
  final Locale? locale;


  const SettingChangedLocale({
    @required this.locale,
  });
  
  @override
  List<Object?> get props => [locale];
}
