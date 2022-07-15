import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/components/card.dart';
import 'package:responsive_tutorial_app/widgets/title_widget.dart';

class NavMenu extends StatelessWidget {
  /// default constructor
  const NavMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Column(
        children: [
          TitleWidget(),
        ],
      ),
    );
  }
}
