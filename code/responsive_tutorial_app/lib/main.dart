import 'package:flutter/material.dart';

import 'layout/main_center_layout.dart';
import 'layout/nav_menu.dart';
import 'layout/side_bar.dart';

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
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          NavMenu(),
          Expanded(child: MainCenterLayout()),
          SideBar(),
        ],
      ),
    );
  }
}
