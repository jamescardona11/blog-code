import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/config/assets.dart';
import 'package:responsive_tutorial_app/config/color.dart';

class TopMenuWidget extends StatelessWidget {
  /// default constructor
  const TopMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'All channels',
          style: TextStyle(
            color: grayColor,
          ),
        ),
        _TopMenuItem(
          label: 'label',
          image: AssetsManager.socialFacebook,
        ),
        _TopMenuItem(
          label: 'label',
          image: AssetsManager.socialInstagram,
          enable: true,
        ),
        _TopMenuItem(
          label: 'label',
          image: AssetsManager.socialLinkedin,
        ),
        _TopMenuItem(
          label: 'label',
          image: AssetsManager.socialYoutube,
        ),
      ],
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
    return Row(
      children: [
        Image.asset(
          image,
          color: grayColor,
        ),
        Text(
          label,
          style: TextStyle(
            color: enable ? blackColor : grayColor,
          ),
        ),
      ],
    );
  }
}
