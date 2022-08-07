import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/color.dart';
import 'package:responsive_tutorial_app/model/feed.dart';

class FeedItemActivityWidget extends StatelessWidget {
  /// default constructor
  const FeedItemActivityWidget({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final Feed feed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(feed.avatar),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Text(
                      feed.user,
                      style: TextStyle(
                        fontSize: 14,
                        color: blueColor,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      feed.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: grayColor,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  feed.label,
                  style: TextStyle(
                    fontSize: 14,
                    color: grayColor,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
