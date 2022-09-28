import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class TopMenuWidget extends StatelessWidget {
  /// default constructor
  const TopMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 20,
      ),
      child: Row(
        children: [
          Text(
            'All channels',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: grayColor,
            ),
          ),
          _TopMenuItem(
            label: 'Facebook',
            image: AssetsManager.socialFacebook,
          ),
          _TopMenuItem(
            label: 'Instagram',
            image: AssetsManager.socialInstagram,
            enable: true,
          ),
          _TopMenuItem(
            label: 'Linkedin',
            image: AssetsManager.socialLinkedin,
          ),
          _TopMenuItem(
            label: 'Youtube',
            image: AssetsManager.socialYoutube,
          ),
          _TopMenuItem(
            label: 'Twitter',
            image: AssetsManager.socialTwitter,
          ),
        ],
      ),
    );
  }
}

class _TopMenuItem extends StatelessWidget {
  const _TopMenuItem({
    Key? key,
    required this.label,
    required this.image,
    this.enable = false,
  }) : super(key: key);

  final String image;
  final String label;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Image.asset(
            image,
            color: grayColor,
            width: 24,
          ),
          SizedBox(width: 3),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: enable ? blackColor : grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
