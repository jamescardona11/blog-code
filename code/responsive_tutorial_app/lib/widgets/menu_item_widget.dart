import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class MenuItemWidget extends StatelessWidget {
  /// default constructor
  const MenuItemWidget({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 21,
            height: 21,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: blueColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
