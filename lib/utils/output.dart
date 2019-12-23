import 'package:decimal/decimal.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'formatting/output_formatting.dart';

@immutable
class Output<T extends OutputFormatting> {
  final Decimal error;
  final Decimal result;
  final int precision;
  final T outputFormatting;
  final Decimal x;
  final int calculationNumber;

  Output(
      {@required this.error,
      @required this.result,
      @required this.precision,
      @required this.outputFormatting,
      @required this.x,
      @required this.calculationNumber});

  String get resultString {
    var decimalLength = (result - result.truncate()).toString().length;
    return result.toString().padRight(precision - decimalLength - 1);
  }

  Widget get display => outputFormatting.display(result, precision);
}
