import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_tutorial_app/config/color.dart';

import 'components/card.dart';

class GraphWidget extends StatelessWidget {
  /// default constructor
  const GraphWidget({
    Key? key,
    required this.image,
    this.showHeader = false,
    this.width,
    this.height,
    this.fontSize = 36,
    this.headerWidget,
  }) : super(key: key);

  final bool showHeader;
  final double? width;
  final double? height;
  final double fontSize;
  final Widget? headerWidget;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      width: width,
      height: height,
      child: Stack(
        children: [
          Column(
            children: [
              if (showHeader && headerWidget != null) headerWidget!,
              Row(
                children: [
                  Text(
                    '1.05m',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '+8.5%',
                    style: TextStyle(
                      fontSize: 12,
                      color: greenColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              image,
              color: greenColor,
            ),
          ),
        ],
      ),
    );
  }
}
