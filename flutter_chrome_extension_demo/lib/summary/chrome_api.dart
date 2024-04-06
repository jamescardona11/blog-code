@JS('chrome')
library main; // library name can be whatever you want

import 'package:js/js.dart';

@JS('tabs.query')
external Future<List<Tab>> query(ParameterQueryTabs parameterQueryTabs);

@JS()
@anonymous
class Tab {
  external factory Tab({String url});

  external String get url;
}

@JS()
@anonymous
class ParameterQueryTabs {
  external factory ParameterQueryTabs({
    bool active,
    bool lastFocusedWindow,
  });

  external bool get active;

  external bool get lastFocusedWindow;
}
