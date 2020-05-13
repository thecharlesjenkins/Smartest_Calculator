import 'dart:async';

import 'package:rxdart/subjects.dart';

class Bloc<T> {
  Stream<T> get getInput => _controller.stream;

  BehaviorSubject<T> get subject => _controller;

  BehaviorSubject<T> _controller = BehaviorSubject<T>();

  ///[seed] is an optional parameter to initialize bloc with a default value
  Bloc([T seed]) {
    if (seed != null) {
      _controller = BehaviorSubject.seeded(seed);
    }
  }

  void update(T input) {
    _controller.sink.add(input);
  }

  void dispose() {
    _controller.close();
  }
}