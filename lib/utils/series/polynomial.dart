import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/utils/series/term_formatting.dart';

import '../formatting/result_display.dart';
import '../output_display.dart';
import 'series_output.dart';

class Polynomial extends OutputDisplay<List<SeriesOutput>, Decimal> {
  List<SeriesOutput> output = List<SeriesOutput>();

  Decimal get currentResult => output.last.result;

  String get currentResultString => output.last.resultString;

  final TermFormatting term;

  Polynomial(this.term, {List<SeriesOutput> initialData}) {
    output = initialData;
  }

  void addOutput(SeriesOutput newOutput) {
    if (output == null) {
      output = [newOutput];
    } else {
      output.add(newOutput);
    }
  }

  void addAll(List<SeriesOutput> newOutputs) {
    output.addAll(newOutputs);
  }

  Polynomial polynomialOfLowerPrecision(int precision) {
    List<SeriesOutput> temp = [];
    output.firstWhere((e) {
      if (output.last.precision < precision) {
        temp.add(e);
        return false;
      }
      return true;
    }, orElse: () {});
    return Polynomial(term, initialData: temp);
  }

  List<Widget> get listDisplay {
    List<Widget> widgets = output.expand((out) {
      return [
        Text("+"),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: OutlinedContainer(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: out.display,
          )),
        )
      ];
    }).toList();

    return widgets.length > 0 ? widgets.sublist(1) : widgets;
  }

  Widget get polynomialDisplay {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisSize: MainAxisSize.min, children: listDisplay));
  }

  Widget get resultDisplay => ResultDisplay(currentResultString);

  Widget get outputStepsDisplay => polynomialDisplay;
}

class OutlinedContainer extends Container {
  OutlinedContainer({@required Widget child, Color color = Colors.blue})
      : super(
            key: ObjectKey(child),
            child: child,
            decoration: BoxDecoration(
                border: Border.all(color: color, width: 3),
                borderRadius: BorderRadius.circular(10)));
}
