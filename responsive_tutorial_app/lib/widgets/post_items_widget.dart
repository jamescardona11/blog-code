import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';

class PostItemsWidget extends StatelessWidget {
  /// default constructor
  const PostItemsWidget({
    Key? key,
    required this.date,
    required this.image,
    required this.user,
    required this.message,
    required this.likes,
    required this.comments,
    required this.saved,
  }) : super(key: key);

  final String date;
  final String image;
  final String user;
  final String message;
  final String likes;
  final String comments;
  final String saved;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(date),
        ),
        Image.asset(image),
        Column(
          children: [
            Text(user),
            Text(message),
            Row(
              children: [
                Image.asset(AssetsManager.like),
                Text(likes),
                Image.asset(AssetsManager.comments),
                Text(comments),
                Image.asset(AssetsManager.bookmark),
                Text(saved),
              ],
            )
          ],
        )
      ],
    );
  }
}
