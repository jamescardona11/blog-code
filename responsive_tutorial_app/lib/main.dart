import 'package:flutter/material.dart';

import 'components/side_bar.dart';
import 'components/main_center_layout.dart';
import 'components/nav_menu.dart';

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
          Expanded(
            child: MainCenterLayout(),
          ),
          SideBar(),
        ],
      ),
    );
  }
}
