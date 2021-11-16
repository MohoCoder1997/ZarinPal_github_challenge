import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_challenge/application/user/bloc/user_bloc.dart';
import 'package:github_challenge/presentation/core/load_fail_view.dart';
import 'package:github_challenge/presentation/core/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SC().init(context);
    //final _userBloc = sl<UserBloc>();
    final _userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/github-logo.png',
              height: SC.blockVertical * 3,
              width: SC.blockVertical * 3,
            ),
            SizedBox(
              width: SC.blockHorizontal * 2,
            ),
            Text(
              'GithupApi',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
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
              Image.asset(
                'assets/images/github-logo.png',
                height: SC.blockVertical * 40,
                width: SC.blockHorizontal * 50,
              ),
              SizedBox(
                height: SC.blockVertical * 2,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'UserName'),
              ),
              SizedBox(
                height: SC.blockVertical * 4,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  print(state);
                  return ElevatedButton(
                    onPressed: state is UserLoadInProgress
                        ? null
                        : () {
                            _userBloc.add(UserFetchedData(userName: '.'));
                          },
                    child: Text('serch'),
                  );
                },
              ),
              SizedBox(
                height: SC.blockVertical * 5,
              ),
              BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {},
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
                  if (state is UserLoadSuccess)
                    return CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl: state.user.imgUrl ?? '',
                    );
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
