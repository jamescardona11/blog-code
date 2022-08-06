import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/components/card.dart';
import 'package:responsive_tutorial_app/config/assets.dart';

class GenderBreakdownWidget extends StatelessWidget {
  /// default constructor
  const GenderBreakdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Column(
        children: [
          Title(
            color: Colors.red,
            child: Text('Gender Breakdown'),
          ),
          Row(
            children: [
              Image.asset(AssetsManager.genderGraph),
              Column(
                children: [
                  Row(
                    children: [
                      _GenderNumberWidget(
                        icon: AssetsManager.gender2,
                        label: 'Female',
                        percent: '61%',
                      ),
                      _GenderNumberWidget(
                        icon: AssetsManager.gender1,
                        label: 'Male',
                        percent: '31%',
                      ),
                      _GenderNumberWidget(
                        icon: AssetsManager.gender3,
                        label: 'Other',
                        percent: '8%',
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _GenderNumberWidget extends StatelessWidget {
  const _GenderNumberWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.percent,
  }) : super(key: key);

  final String icon;
  final String label;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Hello'),
      ),
    );
  }
}
