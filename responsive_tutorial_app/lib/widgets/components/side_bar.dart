import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/color.dart';
import 'package:responsive_tutorial_app/model/feed.dart';
import 'package:responsive_tutorial_app/widgets/feed_activity_widget.dart';
import 'package:responsive_tutorial_app/widgets/header_me_widget.dart';
import 'package:responsive_tutorial_app/widgets/header_simulate_tabs.dart';

import 'card.dart';

class SideBar extends StatelessWidget {
  /// default constructor
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;

        if (size.width <= 1630)
          return Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: blueColor,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                primary: Colors.white,
              ),
            ),
          );

        return SizedBox(
          width: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderMeWidget(),
              SizedBox(height: 20),
              Expanded(
                child: CardComponent(
                  height: size.height,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      HeaderTabsWidget(
                        label1: 'Activity feed',
                        label2: 'Mentions',
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          itemCount: feedActivity.length,
                          itemBuilder: (_, index) => FeedItemActivityWidget(
                            feed: feedActivity[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class HeaderTabsWidget extends StatelessWidget {
  const HeaderTabsWidget({
    Key? key,
    required this.label1,
    required this.label2,
  }) : super(key: key);

  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            HeaderSimulateTabs(labelHeader: label1),
            ColoredBox(
              color: blueColor,
              child: SizedBox(
                height: 1,
                width: 120,
              ),
            )
          ],
        ),
        HeaderSimulateTabs(
          labelHeader: label2,
        ),
      ],
    );
  }
}
