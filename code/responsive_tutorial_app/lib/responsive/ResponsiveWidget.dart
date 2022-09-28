import 'package:flutter/material.dart';

const mobileMaxWidth = 700;
const webMaxWidth = 1200;

class ResponsiveWidget extends StatelessWidget {
  /// default constructor
  const ResponsiveWidget({
    Key? key,
    this.mobile,
    this.tablet,
    this.web,
  }) : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? web;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _maxWidth = constraints.maxWidth;

        if (_maxWidth < mobileMaxWidth) {
          return mobile ?? SizedBox();
        } else if (_maxWidth < webMaxWidth) {
          return tablet ?? SizedBox();
        }

        return web ?? SizedBox();
      },
    );
  }
}
