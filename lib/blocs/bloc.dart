import 'dart:async';

import 'package:rxdart/subjects.dart';

abstract class Bloc<T, V> {
  Stream<V> get getOutput => subject.map((event) => event as V);

  BehaviorSubject<T> get subject => _controller;

  BehaviorSubject<T> _controller = BehaviorSubject<T>();

  Bloc();

  Bloc.seeded(T seed) : assert(seed != null) {
    _controller = BehaviorSubject.seeded(seed);
  }

  void update(T input) {
    subject.sink.add(input);
  }

  void dispose() {
    _controller.close();
  }
}
