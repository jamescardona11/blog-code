import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';

import 'components/card.dart';

class HeaderMeWidget extends StatelessWidget {
  /// default constructor
  const HeaderMeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsManager.icGraph,
          color: blackColor,
        ),
        SizedBox(width: 18),
        Image.asset(
          AssetsManager.icNotifications,
          color: blackColor,
        ),
        SizedBox(width: 18),
        CardComponent(
          padding: EdgeInsets.all(5),
          radius: 10,
          child: Row(
            children: [
              Image.asset(
                AssetsManager.icAvatar,
              ),
              SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: blueColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Drenan',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: blueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              Icon(
                Icons.keyboard_arrow_down_sharp,
              )
            ],
          ),
        )
      ],
    );
  }
}
