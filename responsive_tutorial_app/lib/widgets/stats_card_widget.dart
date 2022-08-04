import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Row(
      children: [
        Column(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: menuColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              count,
              style: GoogleFonts.poppins(
                fontSize: 26,
                color: menuColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Image.asset(
          iconPath,
          width: 30,
          height: 30,
        ),
      ],
    );
  }
}
