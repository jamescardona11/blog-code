import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/model/post.dart';
import 'package:responsive_tutorial_app/widgets/components/card.dart';
import 'package:responsive_tutorial_app/widgets/graph_widget.dart';
import 'package:responsive_tutorial_app/widgets/header_graph_widget.dart';
import 'package:responsive_tutorial_app/widgets/post_items_widget.dart';
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
          RowStatsCardWidget(),
          StatisticsWidget(),
          SizedBox(
            height: 480,
            width: 960,
            child: Row(
              children: [
                Expanded(
                  child: CardComponent(
                    child: ListView.builder(
                      itemCount: postElements.length,
                      itemBuilder: (_, index) => PostItemsWidget(
                        post: postElements[index],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CardComponent(
                    child: ListView.builder(
                      itemCount: postElements.length,
                      itemBuilder: (_, index) => PostItemsWidget(
                        post: postElements[index],
                      ),
                    ),
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

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GraphWidget(
              width: 520,
              label: '1.05m',
              image: AssetsManager.graphLine,
              showHeader: true,
              headerWidget: MultiLabelHeaderWidget(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GraphWidget(
                      width: 220,
                      height: 220,
                      label: '31.6k',
                      image: AssetsManager.graphChart,
                      showHeader: true,
                      headerWidget: HeaderGraphWidget(
                        labelHeader: 'Post shares',
                      ),
                    ),
                    GraphWidget(
                      width: 220,
                      height: 220,
                      label: '2.7k',
                      image: AssetsManager.graphChart,
                      showHeader: true,
                      headerWidget: HeaderGraphWidget(
                        labelHeader: 'New Followers',
                      ),
                    ),
                  ],
                ),
                CardComponent(
                  width: 440,
                  height: 180,
                  child: Container(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RowStatsCardWidget extends StatelessWidget {
  const RowStatsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
