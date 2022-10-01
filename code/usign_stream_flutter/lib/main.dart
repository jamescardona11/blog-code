import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  /// default constructor
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final strController = StreamController<String>();
  final List<String> petsList = [];

  @override
  void initState() {
    super.initState();
    // executeStreams();
    initStreamControllerExample();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Text'),
      ),
      body: StreamBuilder<String>(
        stream: strController.stream,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            petsList.add(snapshot.requireData);
          }

          return ListView.builder(
            itemCount: petsList.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(petsList[i]),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    strController.close();
    super.dispose();
  }

  Future<void> initStreamControllerExample() async {
    // This is the information to emit, which can be obtained from a DB, API, etc.
    final pets = ['Cat', 'Dog', 'Parrot', 'Rabbit', 'Cow', 'Sheep'];

    for (final pet in pets) {
      await Future.delayed(Duration(milliseconds: 1500));

      strController.add(pet);
    }
  }

  Future<void> executeStreams() async {
    // await is to wait the finish each step
    await numbersTo10().forEach((element) {
      print('Number: $element');
    });

    await streamPeriodic().forEach((element) {
      print(element);
    });

    await onlyOdds().forEach((element) {
      print('Odds: $element');
    });
  }

  Stream<int> numbersTo10() {
    return Stream.fromIterable(List.generate(10, (index) => index));
  }

  Stream<int> onlyOdds() {
    return Stream.fromIterable(List.generate(10, (index) => index))
        .where((event) => event % 2 == 0);
  }

  Stream<String> streamPeriodic() {
    return Stream<String>.periodic(
        const Duration(seconds: 1), (c) => 'Periodic, c = $c').take(5);
  }
}
