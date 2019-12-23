import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/ui/input_fields.dart';
import 'package:smartest_calculator/utils/factorial.dart';
import 'package:smartest_calculator/utils/formatting/decimal_formatting.dart';
import 'package:smartest_calculator/utils/input.dart';
import 'package:smartest_calculator/utils/series/series_output.dart';
import 'package:smartest_calculator/utils/series/polynomial.dart';

import '../base_algorithm.dart';

abstract class Maclaurin implements Algorithm {
  ColorSwatch get color =>
      ColorSwatch(Colors.blue.value, {'appBar': Colors.blue[800]});

  Polynomial polynomial;

  Input previousInput = Input(Decimal.zero, 0);

  Bloc<Polynomial> bloc;

  List<Field> get fields => [InputField.decimal, InputField.precision];

  Maclaurin(Bloc<Polynomial> poly) {
    bloc = poly;
    polynomial = Polynomial(outputFormatting);
    precisionListener(fields[1].bloc.getInput);
    decimalListener(fields[0].bloc.getInput);
  }

  void precisionListener(Stream<int> precision) {
    precision.listen((integer) {
      if (integer != previousInput.precision) {
        computeFunction(Input(previousInput.input, integer));
      }
    });
  }

  void decimalListener(Stream<Decimal> decimal) {
    decimal.listen((input) {
      if (input != previousInput.input) {
        polynomial = Polynomial(outputFormatting);
        computeFunction(Input(input, previousInput.precision));
      }
    });
  }

  @protected
  void computeFunction(Input input) {
    _getTerms(input);
  }

  void _getTerms(Input input) {
    int n = 0;
    Decimal decimalPrecision = toDecimalPrecision(input.precision);
    Decimal summation = Decimal.zero;
    Decimal error;
    if (input.input == previousInput.input) {
      if (input.precision < previousInput.precision) {
        bloc.update(polynomial.polynomialOfLowerPrecision(input.precision));
        return;
      } else if (input.precision > previousInput.precision) {
        n = polynomial.output.length;
        summation = polynomial.currentResult;
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
      polynomial.addOutput(newOutput);
      bloc.update(polynomial);
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
  String toString() => polynomial.toString();
}
