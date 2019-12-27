import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
import 'package:smartest_calculator/utils/factorial.dart';
import 'package:smartest_calculator/utils/formatting/decimal_formatting.dart';
import 'package:smartest_calculator/utils/input.dart';
import 'package:smartest_calculator/utils/series/polynomial.dart';
import 'package:smartest_calculator/utils/series/series_output.dart';

abstract class Maclaurin implements Algorithm<AlgorithmInput> {
  ColorSwatch get color =>
      ColorSwatch(Colors.blue.value, {'appBar': Colors.blue[800]});

  Polynomial _polynomial;

  AlgorithmInput previousInput;

  AlgorithmInput _fields;

  AlgorithmInput get inputs {
    if (_fields == null) {
      _fields = AlgorithmInput();
    }
    return _fields;
  }

  Maclaurin(Bloc<Polynomial> poly) {
    _polynomial = Polynomial(outputFormatting);
  }

  Stream<Polynomial> computeFunction(AlgorithmInput input) {
    return _getTerms(input);
  }

  Stream<Polynomial> _getTerms(AlgorithmInput input) async* {
    int n = 0;
    Decimal decimalPrecision = toDecimalPrecision(input.precision);
    Decimal summation = Decimal.zero;
    Decimal error;
    if (previousInput != null && input.input == previousInput.input) {
      if (input.precision < previousInput.precision) {
        yield _polynomial.polynomialOfLowerPrecision(input.precision);
        return;
      } else if (input.precision > previousInput.precision) {
        n = _polynomial.output.length;
        summation = _polynomial.currentResult;
      }
    }
    while (decimalPrecision < (error = errorBound(input.input, n))) {
      summation += maclaurinSeries(input.input, n);
      SeriesOutput newOutput = SeriesOutput(
          error: error,
          result: summation,
          precision: numDecimalPlaces(error, summation),
          termFormatting: outputFormatting,
          x: input.input,
          calculationNumber: n);
      _polynomial.addOutput(newOutput);
      yield _polynomial;
      n++;
    }

    previousInput = input;
  }

  Decimal maximumValue(Decimal x);

  Decimal maclaurinSeries(Decimal input, int n);

  Decimal errorBound(Decimal input, int n) {
    return (maximumValue(Decimal.zero) * (input).pow(n + 1)) / factorial(n + 1);
  }

  @override
  String toString() => _polynomial.toString();
}
