import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_challenge/application/setting/bloc/setting_bloc.dart';
import 'package:github_challenge/presentation/core/app_themes.dart';
import 'package:simple_animations/simple_animations.dart';

class ThemeModeBottun extends StatefulWidget {
  const ThemeModeBottun({
    Key? key,
  }) : super(key: key);

  @override
  _ThemeModeBottunState createState() => _ThemeModeBottunState();
}

class _ThemeModeBottunState extends State<ThemeModeBottun> {
  bool isChangedMode = false;
  bool? isDarkMode;
  @override
  Widget build(BuildContext context) {
    final _settingBloc = BlocProvider.of<SettingBloc>(context, listen: false);

    if (isDarkMode == null) {
      if (_settingBloc.state.themeData == appThemeData[AppTheme.Dark])
        isDarkMode = true;
      else
        isDarkMode = false;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        child: CustomAnimation(
          control: isChangedMode
              ? CustomAnimationControl.play
              : CustomAnimationControl.playReverse,
          duration: Duration(milliseconds: 400),
          tween: Tween(begin: 0.0, end: 2 * 3.14),
          builder: (context, child, double value) {
            return Transform.rotate(
              angle: value,
              child: isDarkMode!
                  ? Icon(
                      value > (3.14 - .14)
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      size: 30,
                    )
                  : Icon(
                      value > (3.14 - .14)
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      size: 30,
                    ),
            );
          },
        ),
        onTap: () {
          setState(() {
            if (_settingBloc.state.themeData == appThemeData[AppTheme.Dark]) {
              _settingBloc.add(ChangedTheme(appTheme: AppTheme.Light));
            } else {
              _settingBloc.add(ChangedTheme(appTheme: AppTheme.Dark));
            }

            isChangedMode = !isChangedMode;
          });
        },
      ),
    );
  }
}
