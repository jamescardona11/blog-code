import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/layout/mobile_layout.dart';
import 'package:responsive_tutorial_app/layout/tablet_layout.dart';
import 'package:responsive_tutorial_app/layout/web_layout.dart';

import 'responsive/ResponsiveWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: MobileLayout(),
      tablet: TabletLayout(),
      web: WebLayout(),
    );
  }
}
