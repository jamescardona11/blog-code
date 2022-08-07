import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/components/card.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/model/feed.dart';
import 'package:responsive_tutorial_app/widgets/header_me_widget.dart';
import 'package:responsive_tutorial_app/widgets/top_menu_widget.dart';

import 'components/nav_menu.dart';
import 'config/color.dart';
import 'widgets/feed_activity_widget.dart';
import 'widgets/graph_widget.dart';
import 'widgets/stats_card_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          NavMenu(),
          Expanded(
            // flex: 6,
            child: Padding(
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
            ),
          ),
          SizedBox(
            width: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderMeWidget(),
                Expanded(
                  child: CardComponent(
                    height: size.height,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Activity feed',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: blueColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ColoredBox(
                                    color: blueColor,
                                    child: SizedBox(
                                      height: 1,
                                      width: 120,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Mentions',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: grayColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
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
          )
        ],
      ),
    );
  }
}
