import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/model/post.dart';
import 'package:responsive_tutorial_app/widgets/components/card.dart';
import 'package:responsive_tutorial_app/widgets/gender_breakdown_widget.dart';
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
    final size = MediaQuery.of(context).size;

    final leftPadding = size.width < 1360 || size.width > 1630 ? 25.0 : 290.0;

    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: 30,
        top: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopMenuWidget(),
          SizedBox(height: 30),
          _RowStatsCardWidget(),
          _StatisticsWidget(),
          _PostWidgetAndGender(),
        ],
      ),
    );
  }
}

class _PostWidgetAndGender extends StatelessWidget {
  const _PostWidgetAndGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minHeight: 360,
        maxHeight: size.height * 0.4,
        maxWidth: 960,
        minWidth: 720,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                child: CardComponent(
                  height: constraints.maxHeight,
                  child: ListView.builder(
                    itemCount: postElements.length,
                    itemBuilder: (_, index) => PostItemsWidget(
                      post: postElements[index],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    GenderBreakdownWidget(),
                    GraphWidget(
                      width: 480,
                      height: 200,
                      label: '',
                      image: AssetsManager.graphChart,
                      showHeader: true,
                      headerWidget: HeaderGraphWidget(
                        labelHeader: 'Post shares',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatisticsWidget extends StatelessWidget {
  const _StatisticsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minHeight: 360,
        maxHeight: size.height * 0.4,
        maxWidth: 960,
        minWidth: 720,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
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
                    height: constraints.maxHeight * 0.4,
                    child: Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RowStatsCardWidget extends StatelessWidget {
  const _RowStatsCardWidget({
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
