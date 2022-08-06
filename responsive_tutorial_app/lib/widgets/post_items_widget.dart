import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/model/post.dart';

class PostItemsWidget extends StatelessWidget {
  /// default constructor
  const PostItemsWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(post.date),
        ),
        Image.asset(post.image),
        Column(
          children: [
            Text(post.user),
            Text(post.message),
            Row(
              children: [
                Image.asset(AssetsManager.like),
                Text(post.likes),
                Image.asset(AssetsManager.comments),
                Text(post.comments),
                Image.asset(AssetsManager.bookmark),
                Text(post.saved),
              ],
            )
          ],
        )
      ],
    );
  }
}
