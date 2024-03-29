import 'package:flutter/material.dart';

import 'package:responsive_tutorial_app/widgets/components/main_center_layout.dart';
import 'package:responsive_tutorial_app/widgets/components/nav_menu.dart';
import 'package:responsive_tutorial_app/widgets/components/side_bar.dart';

class WebLayout extends StatelessWidget {
  /// default constructor
  const WebLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth <= 1630) {
            return Stack(
              children: [
                MainCenterLayout(),
                NavMenu(),
                SideBar(),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavMenu(),
                MainCenterLayout(),
                SideBar(),
              ],
            );
          }
        },
      ),
    );
  }
}
