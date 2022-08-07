import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/color.dart';
import 'package:responsive_tutorial_app/model/feed.dart';
import 'package:responsive_tutorial_app/widgets/feed_activity_widget.dart';
import 'package:responsive_tutorial_app/widgets/header_me_widget.dart';

import 'card.dart';

class SideBar extends StatelessWidget {
  /// default constructor
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
  }
}
