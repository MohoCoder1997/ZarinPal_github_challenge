part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final ThemeData? themeData;
  final Locale? locale;
  const SettingState({
    @required this.themeData,
    @required this.locale,
  });

  List<Object?> get props => [themeData, locale];
}
