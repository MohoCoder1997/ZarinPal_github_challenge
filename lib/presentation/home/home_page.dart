import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SC().init(context);
    final _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarView(
          title: AppLocalizations.of(context)!.translate(LangKeys.GITHUB_TITLE),
        ),
        leading: ThemeModeBottun(),
        actions: [
          // Locale('en', 'US'),
          // Locale('fa', 'IR'),
          IconButton(
            onPressed: () {
              if (context.read<SettingBloc>().state.locale ==
                  Locale('en', 'US'))
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
          )
        ],
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
              SizedBox(
                height: SC.blockVertical * 2,
              ),
              _userNameTextField(),
              SizedBox(
                height: SC.blockVertical * 4,
              ),
              _serchBottun(_userBloc),
              SizedBox(
                height: SC.blockVertical * 5,
              ),
              _progressIndicator(_userBloc)
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<UserBloc, UserState> _progressIndicator(UserBloc _userBloc) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoadSuccess) {
          NavigationHandler.goToPage(
            context,
            page: BlocProvider(
              create: (context) => sl<RepoBloc>()
                ..add(
                  RepoFetchedData(
                    
                  ),
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
        return SizedBox();
      },
    );
  }

  BlocBuilder<UserBloc, UserState> _serchBottun(UserBloc _userBloc) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is UserLoadInProgress
              ? null
              : () {
                  if (_textEditingController.text != '')
                    _userBloc.add(
                        UserFetchedData());
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: _snackBarView(),
                      ),
                    );
                },
          child: Text(
              AppLocalizations.of(context)!.translate(LangKeys.SEARCH_BTN_TXT)),
        );
      },
    );
  }

  Row _snackBarView() {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: Colors.red,
        ),
        SizedBox(
          width: SC.blockHorizontal * 2,
        ),
        Text(AppLocalizations.of(context)!.translate(LangKeys.SNACK_BAR_TXT)),
      ],
    );
  }

  TextField _userNameTextField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.translate(LangKeys.USER_NAME),
      ),
      controller: _textEditingController,
    );
  }

  Image _githubLogo() {
    return Image.asset(
      'assets/images/github-logo.png',
      height: SC.blockVertical * 40,
      width: SC.blockHorizontal * 50,
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
