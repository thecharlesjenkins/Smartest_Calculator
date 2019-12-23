import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

///[T] is the type of data that the algorithm returns
///[V] is the type of data that the algorithm's final result is
abstract class OutputDisplay<T, V> {
  T output;

  V get currentResult;

  Widget get outputStepsDisplay;

  Widget get resultDisplay;
}

class EmptyOutputDisplay extends OutputDisplay {
  Decimal get currentResult => Decimal.zero;

  Widget get outputStepsDisplay => Container();

  Widget get resultDisplay => Text("0.0");
}
