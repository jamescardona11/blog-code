import 'package:flutter/material.dart';
import 'package:responsive_tutorial_app/components/card.dart';

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

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: NavMenu(),
          ),
          Flexible(
            flex: 3,
            child: CardComponent(
              child: Column(
                children: [],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: CardComponent(
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
