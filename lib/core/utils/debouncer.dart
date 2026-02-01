import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({this.milliseconds = 400});

  void call(VoidCallback callBack) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), callBack);
  }

  void dispose() {
    _timer?.cancel();
  }
}
