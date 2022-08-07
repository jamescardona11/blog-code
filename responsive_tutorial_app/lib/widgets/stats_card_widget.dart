import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/components/card.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class StatsCardWidget extends StatelessWidget {
  /// default constructor
  const StatsCardWidget({
    Key? key,
    required this.label,
    required this.count,
    required this.iconPath,
  }) : super(key: key);

  final String label;
  final String count;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CardComponent(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: blueColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '$count\K',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: blueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(width: 70),
            Image.asset(
              iconPath,
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
