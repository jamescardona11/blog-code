import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/components/card.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class GraphWidget extends StatelessWidget {
  /// default constructor
  const GraphWidget({
    Key? key,
    required this.image,
    this.showHeader = false,
    this.width,
    this.height,
    this.fontSize = 36,
    this.labelHeader,
  }) : super(key: key);

  final bool showHeader;
  final double? width;
  final double? height;
  final double fontSize;
  final String? labelHeader;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      width: width,
      height: height,
      child: Stack(children: [
        Column(
          children: [
            if (showHeader && labelHeader != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    labelHeader!,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: blueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
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
        Image.asset(
          image,
          color: greenColor,
        ),
      ]),
    );
  }
}
