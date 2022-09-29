import 'dart:async';

import 'package:flutter/material.dart';

abstract class NewBaseDialog<R> {
  late Completer<R?> completer = Completer<R?>();
  bool running = false;

  String get id;

  bool get isCompleted => completer.isCompleted;

  Future<R?> show(BuildContext context);

  @protected
  Future<R?> protectedCenterShow(
    BuildContext context,
    Widget dialogContent,
  ) {
    showDialog<R>(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dialogContent,
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (!isCompleted) {
        completer.complete(value);
      }
    });

    return completer.future;
  }

  @override
  bool operator ==(covariant NewBaseDialog<R> other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
