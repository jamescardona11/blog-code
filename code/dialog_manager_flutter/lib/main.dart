import 'dart:math';

import 'package:dialog_manager_flutter/base_dialog.dart';
import 'package:flutter/material.dart';

import 'dialog_manager_widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: DialogWrapper(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  /// default constructor
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                onPressed: () async {
                  int r = Random().nextInt(1000) + 1;
                  final result = await DialogManagerProvider.of(context)
                      .add(TutorialConfirmDialog('Dialog1$r'));

                  print('result: $result');
                },
                child: Text('Launch One Single Dialog'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                onPressed: () async {
                  int r = Random().nextInt(1000) + 1;
                  final result = await DialogManagerProvider.of(context)
                      .add(TutorialConfirmDialog('Dialog1$r'));

                  print('result: $result');
                },
                child: Text('Launch Three Dialogs'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                onPressed: () async {
                  int r = Random().nextInt(1000) + 1;
                  final result = await DialogManagerProvider.of(context)
                      .add(TutorialConfirmDialog('Dialog1$r'));

                  print('result: $result');
                },
                child: Text('Launch Ten Dialogs'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialConfirmDialog extends NewBaseDialog<bool> {
  @override
  final String id;

  TutorialConfirmDialog(this.id);

  @override
  Future<bool?> show(BuildContext context) {
    TutorialConfirmDialogWidget dialog = TutorialConfirmDialogWidget();

    return protectedCenterShow(
      context,
      dialog,
    );
  }
}

class TutorialConfirmDialogWidget extends StatelessWidget {
  const TutorialConfirmDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            'Confirm Dialog',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            'Do you want to test the dialog master ?',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Yes!'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
