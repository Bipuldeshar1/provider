import 'package:flutter/material.dart';

class P1Provider with ChangeNotifier {
  double _value = 1;
  double get value => _value;

  void setvaue(double val) {
    _value = val;
    notifyListeners();
  }
}
