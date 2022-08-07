import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/widgets/stats_card_widget.dart';
import 'package:responsive_tutorial_app/widgets/top_menu_widget.dart';

class MainCenterLayout extends StatelessWidget {
  /// default constructor
  const MainCenterLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopMenuWidget(),
          SizedBox(height: 30),
          Row(
            children: [
              StatsCardWidget(
                label: 'Followers',
                iconPath: AssetsManager.icFollowers,
                count: '1000',
              ),
              StatsCardWidget(
                label: 'Following',
                iconPath: AssetsManager.icFollowing,
                count: '1000',
              ),
              StatsCardWidget(
                label: 'Followers',
                iconPath: AssetsManager.icComments,
                count: '1000',
              ),
              StatsCardWidget(
                label: 'Followers',
                iconPath: AssetsManager.icLikes,
                count: '1000',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
