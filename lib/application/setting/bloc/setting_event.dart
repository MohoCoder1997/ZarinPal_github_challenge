part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
}

class ChangedTheme extends SettingEvent {
  final AppTheme? appTheme;

  const ChangedTheme({
    @required this.appTheme,
  });
  @override
  List<Object?> get props => [appTheme];
}

class ChangedLocale extends SettingEvent {
  final Locale? locale;


  const ChangedLocale({
    @required this.locale,
  });
  
  @override
  List<Object?> get props => [locale];
}
