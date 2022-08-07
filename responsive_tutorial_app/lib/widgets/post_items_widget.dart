import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                post.date,
                style: TextStyle(
                  fontSize: 12,
                  color: grayColor,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          Image.asset(post.image),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user,
                  style: TextStyle(
                    fontSize: 14,
                    color: blueColor,
                    overflow: TextOverflow.clip,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  post.message,
                  style: TextStyle(
                    fontSize: 13,
                    color: grayColor,
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(AssetsManager.like),
                    Text(post.likes),
                    SizedBox(width: 10),
                    Image.asset(AssetsManager.comments),
                    Text(post.comments),
                    SizedBox(width: 10),
                    Image.asset(AssetsManager.bookmark),
                    Text(post.saved),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
