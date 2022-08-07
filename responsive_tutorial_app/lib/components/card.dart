import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  /// default constructor
  const CardComponent({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.radius = 20,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
