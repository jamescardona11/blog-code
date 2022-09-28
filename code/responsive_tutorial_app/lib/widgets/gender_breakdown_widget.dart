import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';

import 'components/card.dart';

class GenderBreakdownWidget extends StatelessWidget {
  /// default constructor
  const GenderBreakdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender Breakdown',
            style: TextStyle(
              fontSize: 16,
              color: blueColor,
              overflow: TextOverflow.clip,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Image.asset(AssetsManager.genderGraph),
              SizedBox(width: 20),
              Column(
                children: [
                  Column(
                    children: [
                      _GenderNumberWidget(
                        icon: AssetsManager.gender2,
                        label: 'Female',
                        percent: '61%',
                      ),
                      SizedBox(height: 5),
                      _GenderNumberWidget(
                        icon: AssetsManager.gender1,
                        label: 'Male',
                        percent: '31%',
                      ),
                      SizedBox(height: 5),
                      _GenderNumberWidget(
                        icon: AssetsManager.gender3,
                        label: 'Other',
                        percent: '8%',
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _GenderNumberWidget extends StatelessWidget {
  const _GenderNumberWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.percent,
  }) : super(key: key);

  final String icon;
  final String label;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: 5),
          Text(label),
          Spacer(),
          Text(
            percent,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: blueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
