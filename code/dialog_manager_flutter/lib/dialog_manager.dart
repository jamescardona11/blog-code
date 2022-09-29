import 'dart:async';
import 'dart:collection';

import 'base_dialog.dart';

class DialogManager {
  final Queue<NewBaseDialog> _dialogQueue = Queue();
  final _dialogStream = StreamController<NewBaseDialog>.broadcast();

  FutureOr<R?> add<R>(NewBaseDialog<R> dialog) {
    if (_dialogQueue.any((d) => d.id == dialog.id)) return null;
    _dialogQueue.add(dialog);
    _run();

    return dialog.completer.future;
  }

  void _run() {
    if (_dialogQueue.isEmpty) return;
    _dialogStream.add(_dialogQueue.removeFirst());
  }

  void clear() {
    _dialogQueue.clear();
  }

  bool contains(String id) => _dialogQueue.any((d) => d.id == id);

  bool get isEmpty => _dialogQueue.any((d) => !d.isCompleted);

  //await Future.delayed(const Duration(seconds: 10));
  Stream<NewBaseDialog> get dialogStream async* {
    yield* _dialogStream.stream.asyncExpand((event) async* {
      yield event;
      await event.completer.future;
    });
  }
}
