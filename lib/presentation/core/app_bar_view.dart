import 'package:flutter/material.dart';
import 'package:github_challenge/presentation/core/size_config.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
