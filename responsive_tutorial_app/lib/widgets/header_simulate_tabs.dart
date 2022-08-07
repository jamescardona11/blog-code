import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class HeaderSimulateTabs extends StatelessWidget {
  /// default constructor
  const HeaderSimulateTabs({
    Key? key,
    required this.labelHeader,
  }) : super(key: key);

  final String labelHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 20),
      child: Text(
        labelHeader,
        style: GoogleFonts.montserrat(
          fontSize: 17,
          color: grayColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
