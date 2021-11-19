import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_challenge/application/auth/bloc/auth_bloc.dart';
import 'package:github_challenge/application/repo/bloc/repo_bloc.dart';
import 'package:github_challenge/application/setting/bloc/setting_bloc.dart';
import 'package:github_challenge/application/user/bloc/user_bloc.dart';
import 'package:github_challenge/injection_container/injection.dart';
import 'package:github_challenge/presentation/core/app_bar_view.dart';
import 'package:github_challenge/presentation/core/load_fail_view.dart';
import 'package:github_challenge/presentation/core/localization/app_localizations.dart';
import 'package:github_challenge/presentation/core/localization/lang/lang_keys.dart';
import 'package:github_challenge/presentation/core/navigation_handler.dart';
import 'package:github_challenge/presentation/core/size_config.dart';
import 'package:github_challenge/presentation/repo/repo_page.dart';

import 'widget/theme_mode_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SC().init(context);
    final _userBloc = BlocProvider.of<UserBloc>(context);
    final _authBloc = BlocProvider.of<AuthBloc>(context);

    final _spacer = SizedBox(
      height: SC.blockVertical * 4,
    );
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(
          title: AppLocalizations.of(context)!.translate(LangKeys.GITHUB_TITLE),
        ),
        leading: ThemeModeBottun(),
        actions: [_langIconButton(context)],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _githubLogo(),
              _spacer,
              _logInBottun(_authBloc, _userBloc),
              _spacer,
              _progressIndicator(_userBloc, _authBloc)
            ],
          ),
        ),
      ),
    );
  }

  IconButton _langIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (context.read<SettingBloc>().state.locale == Locale('en', 'US'))
          context
              .read<SettingBloc>()
              .add(SettingChangedLocale(locale: Locale('fa', 'IR')));
        else {
          context
              .read<SettingBloc>()
              .add(SettingChangedLocale(locale: Locale('en', 'US')));
        }
      },
      icon: Icon(
        Icons.language_outlined,
        size: 30,
      ),
    );
  }

  BlocConsumer<UserBloc, UserState> _progressIndicator(
      UserBloc _userBloc, AuthBloc _authBloc) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoadSuccess) {
          NavigationHandler.goToPage(
            context,
            page: BlocProvider(
              create: (context) => sl<RepoBloc>()
                ..add(
                  RepoFetchedData(),
                ),
              child: RepoPage(user: state.user),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UserLoadInProgress)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (state is UserLoadFailure)
          return LoadFailureView(
            message: state.fail.message ??
                AppLocalizations.of(context)!.translate(LangKeys.LOAD_FAILED),
            onTapTryAgain: () {
              _userBloc.add(UserFetchedData());
            },
          );
        if (state is UserLoadSuccess)
          return Column(
            children: [
              Text(
                'Hello ' + (state.user.name ?? 'User'),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: SC.blockVertical * 2,
              ),
              ElevatedButton(
                onPressed: () {
                  _userBloc.add(UserFetchedData());
                },
                child: Text(AppLocalizations.of(context)!
                    .translate(LangKeys.GO_TO_DETAIL)),
              ),
              ElevatedButton(
                onPressed: () {
                  _userBloc.add(UserLogedOut());
                  _authBloc.add(AuthLogedOut());
                },
                child: Text(
                    AppLocalizations.of(context)!.translate(LangKeys.LOGOUT)),
              ),
            ],
          );
        return SizedBox();
      },
    );
  }

  BlocConsumer<AuthBloc, AuthState> _logInBottun(
      AuthBloc _authbloc, UserBloc _userBloc) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthGetTokenLoadSuccess || state is AuthTokenIsAvailable) {
          _userBloc.add(UserFetchedData());
        }
      },
      builder: (context, state) {
        if (state is AuthLoadInProgress)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (state is AuthLogeInLoadSuccess)
          return _loginMessageText(context, state, _authbloc);
        if (state is AuthOpenLinkSuccess)
          return Center(
            child: OutlinedButton(
              child: Text(
                AppLocalizations.of(context)!.translate(LangKeys.SUBMIT),
                style: Theme.of(context).textTheme.headline3,
              ),
              onPressed: () {
                _authbloc.add(AuthFetchdToken());
              },
            ),
          );
        if (state is AuthGetTokenLoadSuccess || state is AuthTokenIsAvailable)
          return SizedBox();
        if (state is AuthLogeInLoadFail)
          return LoadFailureView(
              message: state.fail.message ??
                  AppLocalizations.of(context)!.translate(LangKeys.LOAD_FAILED),
              onTapTryAgain: () {
                _authbloc.add(AuthLogedInDevice());
              });
        if (state is AuthGetTokenLoadFail)
          return LoadFailureView(
              message: state.fail.message ??
                  AppLocalizations.of(context)!.translate(LangKeys.LOAD_FAILED),
              onTapTryAgain: () {
                _authbloc.add(AuthFetchdToken());
              });
        if (state is AuthGetTokenLoadSuccess)
          return Text(
            AppLocalizations.of(context)!.translate(LangKeys.WAIT),
            style: Theme.of(context).textTheme.subtitle2,
          );
        return ElevatedButton(
          onPressed: state is UserLoadInProgress
              ? null
              : () {
                  _authbloc.add(AuthLogedInDevice());
                },
          child: Text(
              AppLocalizations.of(context)!.translate(LangKeys.SEARCH_BTN_TXT)),
        );
      },
    );
  }

  Center _loginMessageText(
      BuildContext context, AuthLogeInLoadSuccess state, AuthBloc _authbloc) {
    return Center(
      child: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!
                  .translate(LangKeys.LOGIN_MESSAGE_FIRST),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            TextSpan(
              text: state.loginDevice.userCode,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextSpan(
              text: AppLocalizations.of(context)!
                  .translate(LangKeys.LOGIN_MESSAGE_SECONDE),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            TextSpan(
              text: '\n' + state.loginDevice.varificationUri,
              style: Theme.of(context).textTheme.headline3,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _authbloc.add(AuthOpenedLink(loginDevice: state.loginDevice));
                },
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Image _githubLogo() {
    return Image.asset(
      'assets/images/github-logo.png',
      height: SC.blockVertical * 40,
      width: SC.blockHorizontal * 50,
    );
  }
}
