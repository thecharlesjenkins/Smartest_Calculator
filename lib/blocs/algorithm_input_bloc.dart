//import 'package:rxdart/rxdart.dart' show BehaviorSubject;
//import 'package:smartest_calculator/blocs/field_bloc.dart';
//import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
//
//class AlgorithmInputBloc {
//  BehaviorSubject<Algorithm> get subject => _controller;
//
//  final FieldBloc _fieldBloc;
//
//  AlgorithmInputBloc(this._fieldBloc) {
//    _listen();
//  }
//
//  AlgorithmInputBloc.seeded(this._fieldBloc, Algorithm seed)
//      : assert(seed != null) {
//    _controller = BehaviorSubject.seeded(seed);
//    _listen();
//  }
//
//  void _listen() {
//    subject.listen((algorithm) {
//      _fieldBloc.update(algorithm.inputs);
//    });
//  }
//
//  BehaviorSubject<Algorithm> _controller = BehaviorSubject<Algorithm>();
//
//  void update(Algorithm input) {
//    _controller.sink.add(input);
//  }
//
//  void dispose() {
//    _controller.close();
//  }
//}
