import 'dart:async';

import 'package:flutter/material.dart';

import 'base_dialog.dart';
import 'dialog_manager.dart';

class DialogManagerProvider extends InheritedWidget {
  const DialogManagerProvider({
    super.key,
    required this.manager,
    required super.child,
  });

  final DialogManager manager;

  static DialogManager of(BuildContext context) {
    return (context
            .getElementForInheritedWidgetOfExactType<DialogManagerProvider>()
            ?.widget as DialogManagerProvider)
        .manager;
  }

  @override
  bool updateShouldNotify(DialogManagerProvider oldWidget) => false;
}

class DialogWrapper extends StatefulWidget {
  const DialogWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<DialogWrapper> createState() => _DialogWrapperState();
}

class _DialogWrapperState extends State<DialogWrapper> {
  final dialogManager = DialogManager();

  @override
  Widget build(BuildContext context) {
    return DialogManagerProvider(
      manager: dialogManager,
      child: Material(
        child: DialogsListener(
          listener: (context, dialog) async {
            await dialog.show(context);
          },
          child: widget.child,
        ),
      ),
    );
  }
}

typedef ListenerEvents = void Function(
    BuildContext context, NewBaseDialog dialog);

class DialogsListener extends StatefulWidget {
  const DialogsListener({
    Key? key,
    required this.listener,
    required this.child,
  }) : super(key: key);

  final ListenerEvents listener;
  final Widget child;

  @override
  State<DialogsListener> createState() => _DialogsListenerState();
}

class _DialogsListenerState extends State<DialogsListener> {
  StreamSubscription<NewBaseDialog>? _subscription;

  @override
  void initState() {
    super.initState();
    final manager = DialogManagerProvider.of(context);
    _subscribe(manager.dialogStream);
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _subscribe(Stream<NewBaseDialog> dialogs) {
    _subscription = dialogs.listen((event) {
      widget.listener.call(context, event);
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
  }
}
