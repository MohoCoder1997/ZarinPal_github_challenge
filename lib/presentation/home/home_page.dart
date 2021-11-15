import 'package:flutter/material.dart';
import 'package:github_challenge/presentation/core/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SC().init(context);
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
                height: SC.blockVertical *40,
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
              ElevatedButton(onPressed: (){}, child: Text('serch'))
            ],
          ),
        ),
      ),
    );
  }
}
