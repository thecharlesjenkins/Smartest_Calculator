import 'package:decimal/decimal.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:smartest_calculator/utils/formatting/decimal_formatting.dart';

import 'term_formatting.dart';

@immutable
class SeriesOutput {
  final Decimal error;
  final Decimal result;
  final int precision;
  final TermFormatting termFormatting;
  final Decimal x;
  final int calculationNumber;

  SeriesOutput(
      {@required this.error,
      @required this.result,
      @required this.precision,
      @required this.termFormatting,
      @required this.x,
      @required this.calculationNumber});

  String get resultString {
    return writeAsPrecision(result, precision);
  }

  Widget get display => termFormatting.display(x, calculationNumber);
}
