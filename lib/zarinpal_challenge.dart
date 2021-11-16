import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_challenge/presentation/core/size_config.dart';
import 'package:github_challenge/presentation/home/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'application/setting/bloc/setting_bloc.dart';
import 'application/user/bloc/user_bloc.dart';
import 'injection_container/injection.dart';
import 'presentation/core/localization/app_localizations.dart';

class ZarinPalChallenge extends StatelessWidget {
  const ZarinPalChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<SettingBloc>(
      create: (context) => sl<SettingBloc>(),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, SettingState state) {
    
    return MaterialApp(
      home: BlocProvider(
        create: (context) => sl<UserBloc>(),
        child: HomePage(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(widget!,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ]),
      debugShowCheckedModeBanner: false,
      title: 'Neco',
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        AppLocalizations.resolationFallBack(locale, supportedLocales);
      },
      locale: state.locale,
      theme: state.themeData,
      
    );
  }
}
