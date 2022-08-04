import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/components/card.dart';
import 'package:responsive_tutorial_app/config/color.dart';
import 'package:responsive_tutorial_app/widgets/menu_item_widget.dart';
import 'package:responsive_tutorial_app/widgets/title_widget.dart';

class NavMenu extends StatelessWidget {
  /// default constructor
  NavMenu({
    Key? key,
  }) : super(key: key);

  final List<MapEntry<String, String>> menuItems = const [
    MapEntry('DashBoard', 'assets/menu_dashboard.png'),
    MapEntry('Calendar', 'assets/menu_calendar.png'),
    MapEntry('Analytics', 'assets/menu_stats.png'),
    MapEntry('Wallet', 'assets/menu_wallet.png'),
    MapEntry('Chat', 'assets/menu_chat.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      width: 260,
      child: Padding(
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
            Image.asset(
              'assets/frame_33.png',
            ),
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
                      color: menuColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/logout.png',
                    width: 21,
                    height: 21,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
