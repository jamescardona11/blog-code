import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  /// default constructor
  const CardComponent({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
