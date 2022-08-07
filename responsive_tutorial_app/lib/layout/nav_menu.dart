import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';
import 'package:responsive_tutorial_app/widgets/menu_item_widget.dart';
import 'package:responsive_tutorial_app/widgets/title_widget.dart';

import '../widgets/components/card.dart';

class NavMenu extends StatelessWidget {
  /// default constructor
  NavMenu({
    Key? key,
  }) : super(key: key);

  final List<MapEntry<String, String>> menuItems = [
    MapEntry('DashBoard', AssetsManager.menuDashboard),
    MapEntry('Calendar', AssetsManager.menuCalendar),
    MapEntry('Analytics', AssetsManager.menuAnalytics),
    MapEntry('Wallet', AssetsManager.menuWallet),
    MapEntry('Chat', AssetsManager.menuChat),
  ];

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      width: 260,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(),
                  const SizedBox(height: 50),
                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (_, index) => MenuItemWidget(
                        iconPath: menuItems[index].value,
                        label: menuItems[index].key,
                      ),
                    ),
                  ),

                  // Image.asset('assets/frame_33.png'),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.promoImage),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: blueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Image.asset(
                  AssetsManager.menuLogout,
                  width: 21,
                  height: 21,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
