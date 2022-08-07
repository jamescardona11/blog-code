import 'package:flutter/material.dart';

import 'package:responsive_tutorial_app/config/color.dart';

import 'components/card.dart';

class GraphWidget extends StatelessWidget {
  /// default constructor
  const GraphWidget({
    Key? key,
    required this.image,
    this.label,
    this.showHeader = false,
    this.width,
    this.height,
    this.fontSize = 36,
    this.headerWidget,
  }) : super(key: key);

  final bool showHeader;
  final String? label;
  final double? width;
  final double? height;
  final double fontSize;
  final Widget? headerWidget;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardComponent(
          width: width,
          height: height,
          child: Stack(
            children: [
              Column(
                children: [
                  if (showHeader && headerWidget != null) headerWidget!,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          label!,
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
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    image,
                    color: greenColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
