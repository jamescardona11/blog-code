import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/color.dart';

import 'header_simulate_tabs.dart';

class HeaderGraphWidget extends StatelessWidget {
  /// default constructor
  const HeaderGraphWidget({
    Key? key,
    required this.labelHeader,
  }) : super(key: key);

  final String labelHeader;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelHeader,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: blueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(Icons.more_horiz),
      ],
    );
  }
}

class MultiLabelHeaderWidget extends StatelessWidget {
  const MultiLabelHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              HeaderSimulateTabs(labelHeader: 'Reach'),
              ColoredBox(
                color: blueColor,
                child: SizedBox(
                  height: 1,
                  width: 120,
                ),
              )
            ],
          ),
          HeaderSimulateTabs(labelHeader: 'Impressions'),
          HeaderSimulateTabs(labelHeader: 'New Followers'),
        ],
      ),
    );
  }
}
