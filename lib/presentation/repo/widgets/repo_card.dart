import 'package:flutter/material.dart';
import 'package:github_challenge/domain/entities/repo.dart';
import 'package:github_challenge/presentation/core/size_config.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Repo item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SC.blockVertical * 15,
      child: Card(
        elevation: 4,
        color: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(26))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name ?? '',
                maxLines: 1,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                item.description ?? '',
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Expanded(
                  child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: SC.blockHorizontal * 3,
                        width: SC.blockHorizontal * 3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _languegeColor(item.language),
                        ),
                      ),
                      SizedBox(
                        width: SC.blockHorizontal * 2,
                      ),
                      Text(
                        item.language ?? '',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: SC.blockHorizontal * 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_border_rounded),
                      SizedBox(
                        width: SC.blockHorizontal * 2,
                      ),
                      Text(
                        item.watchers.toString(),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  _languegeColor(String? language) {
    switch (language) {
      case 'Java':
        return Colors.brown;
      case 'Kotlin':
        return Colors.deepPurple;
      case 'Swift':
        return Colors.red;
      case 'Dart':
        return Colors.blue;
      case 'C#':
        return Colors.green;
      case 'HTML':
        return Colors.orange;
      case 'C':
        return Colors.black54;
      default:
        return Colors.grey;
    }
  }
}
