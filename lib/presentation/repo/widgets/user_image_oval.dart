import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_challenge/presentation/core/size_config.dart';

class UserImageOval extends StatelessWidget {
  const UserImageOval({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: CachedNetworkImage(
            height: SC.blockHorizontal * 40,
            width: SC.blockHorizontal * 40,
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            imageUrl: imgUrl ?? '',
          ),
        ),
      ),
    );
  }
}
