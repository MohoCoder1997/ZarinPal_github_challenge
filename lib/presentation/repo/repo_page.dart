import 'package:flutter/material.dart';
import 'package:github_challenge/domain/entities/user.dart';
import 'package:github_challenge/presentation/core/app_bar_view.dart';
import 'package:github_challenge/presentation/core/size_config.dart';
import 'package:github_challenge/presentation/repo/widgets/repository_list_view.dart';
import 'widgets/user_image_oval.dart';

class RepoPage extends StatelessWidget {
  RepoPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final _sizedBoxSpacer = SizedBox(
      height: SC.blockVertical * 2,
    );
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: 'UserInfo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          UserImageOval(
            imgUrl: user.imgUrl,
          ),
          _nameText(context),
          _bioAndUserNameText(
            context,
            maxLines: 1,
            text: user.usreName,
          ),
          _sizedBoxSpacer,
          _bioAndUserNameText(
            context,
            maxLines: 2,
            text: user.bio,
          ),
          _sizedBoxSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _followersColumn(context),
              _followingColumn(context),
              _publicRepoColumn(context),
            ],
          ),
          _sizedBoxSpacer,
          RepositoryListView(user: user)
        ],
      ),
    );
  }

  Column _publicRepoColumn(BuildContext context) {
    return Column(
      children: [
        Text(
          'publicRepos',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          user.publicRepos.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Column _followingColumn(BuildContext context) {
    return Column(
      children: [
        Text(
          'following',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          user.following.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Column _followersColumn(BuildContext context) {
    return Column(
      children: [
        Text(
          'followers',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          user.followers.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Text _bioAndUserNameText(
    BuildContext context, {
    required int maxLines,
    required String? text,
  }) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Text _nameText(BuildContext context) {
    return Text(
      user.name ?? '',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
