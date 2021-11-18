import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_challenge/application/repo/bloc/repo_bloc.dart';
import 'package:github_challenge/application/user/bloc/user_bloc.dart';
import 'package:github_challenge/injection_container/injection.dart';
import 'package:github_challenge/presentation/core/app_bar_view.dart';
import 'package:github_challenge/presentation/core/load_fail_view.dart';
import 'package:github_challenge/presentation/core/navigation_handler.dart';
import 'package:github_challenge/presentation/core/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:github_challenge/presentation/repo/repo_page.dart';

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
          title: 'GitHubApi',
        ),
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
                    userName: _textEditingController.text,
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
            message: state.fail.message ?? 'Load Failed ',
            onTapTryAgain: () {
              _userBloc.add(UserFetchedData(userName: state.userName));
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
                        UserFetchedData(userName: _textEditingController.text));
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: _snackBarView(),
                      ),
                    );
                },
          child: Text('serch'),
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
        Text('Please Enter Your UserName'),
      ],
    );
  }

  TextField _userNameTextField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'UserName',
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
