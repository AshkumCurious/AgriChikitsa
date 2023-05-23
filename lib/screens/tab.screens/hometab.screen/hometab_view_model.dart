import 'package:flutter/material.dart';


class HomeTabScreenViewModel with ChangeNotifier {

  var _loading = false;
  var count = 0;

  bool get loading {
    return _loading;
  }

  setCount() {
    count = count + 1;
    notifyListeners();
  }

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }


}
