import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class TitleWidget extends StatelessWidget {
  /// default constructor
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/title.png'),
        Text(
          'Terroni',
          style: TextStyle(
            fontSize: 22,
            color: primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
