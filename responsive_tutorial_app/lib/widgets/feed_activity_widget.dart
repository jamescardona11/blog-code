import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/model/feed.dart';

class FeedActivityWidget extends StatelessWidget {
  /// default constructor
  const FeedActivityWidget({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final Feed feed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(feed.user),
        Row(
          children: [
            Text(feed.user),
            Text(feed.time),
          ],
        ),
        Text(feed.label)
      ],
    );
  }
}
