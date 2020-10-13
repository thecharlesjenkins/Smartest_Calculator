import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
import 'package:smartest_calculator/utils/factorial.dart';
import 'package:smartest_calculator/utils/formatting/decimal_formatting.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';
import 'package:smartest_calculator/utils/input.dart';
import 'package:smartest_calculator/utils/output_display.dart';
import 'package:smartest_calculator/utils/series/polynomial.dart';
import 'package:smartest_calculator/utils/series/series_output.dart';

class NumberDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OutputDisplay>(
      stream: InjectorWidget.of(context).resultBloc.listenToOutput(),
//      initialData: EmptyOutputDisplay(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.resultDisplay;
        }
        return Container();
      },
    );
  }
}

class OutputStepsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OutputDisplay>(
      stream: InjectorWidget.of(context).resultBloc.listenToOutput(),
      initialData: EmptyOutputDisplay(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.outputStepsDisplay;
        }
        return Container();
      },
    );
  }
}

abstract class Maclaurin implements Algorithm<DecimalPrecisionInput> {
  ColorSwatch get color =>
      ColorSwatch(Colors.blue.value, {'appBar': Colors.blue[800]});

  Input initialInput = DecimalPrecisionInput(Decimal.zero, 5);

  DecimalPrecisionInput previousInput;

  Widget get output {
    return Column(
      children: <Widget>[
        NumberDisplay(),
        OutputStepsDisplay(),
        DecimalPrecisionInputFormat()
      ],
    );
  }

  Maclaurin() {
    _polynomial = Polynomial(outputFormatting);
  }

  Polynomial _polynomial;

  Stream<Polynomial> computeFunction(DecimalPrecisionInput input) {
    return _getTerms(input);
  }

  Stream<Polynomial> _getTerms(DecimalPrecisionInput input) async* {
    int n = 0;
    Decimal decimalPrecision = toDecimalPrecision(input.precision);
    Decimal summation = Decimal.zero;
    Decimal error;
    if (previousInput != null && input.input == previousInput.input) {
      if (input.precision < previousInput.precision) {
        yield _polynomial.polynomialOfLowerPrecision(input.precision);
        //TODO: Return Done
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
    //TODO: Return Done
  }

  Decimal maximumValue(Decimal x);

  Decimal maclaurinSeries(Decimal input, int n);

  Decimal errorBound(Decimal input, int n) {
    return (maximumValue(Decimal.zero) * (input).pow(n + 1)) / factorial(n + 1);
  }

  @override
  String toString() => _polynomial.toString();
}
