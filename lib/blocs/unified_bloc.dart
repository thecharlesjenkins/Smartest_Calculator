import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject;
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';

class UnifiedBloc {
  Stream<Widget> get getOutput =>
      _controller.map((algorithm) => algorithm.output);

  BehaviorSubject<Algorithm> _controller = BehaviorSubject<Algorithm>();

//  UnifiedBloc({@required Algorithm seed}) : assert(seed != null) {
//    _controller = BehaviorSubject.seeded(seed);
//  }

  void update(Algorithm input) {
    _controller.sink.add(input);
  }

  void dispose() {
    _controller.close();
  }
}
