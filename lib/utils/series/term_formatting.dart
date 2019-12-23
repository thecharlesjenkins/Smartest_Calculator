import 'package:decimal/decimal.dart';
import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/ui/fraction.dart';
import 'package:smartest_calculator/utils/series/term_piece.dart';

import '../formatting/output_formatting.dart';
import '../formatting/superscript.dart';

class TermFormatting implements OutputFormatting {
  TermPiece exponent;
  TermPiece bottom;
  TermPiece alternating;
  bool factorial;

  TermFormatting({
    this.exponent,
    this.bottom,
    this.factorial = true,
    this.alternating,
  });

  Widget display(Decimal x, int n, {bool noCompute = false}) {
    String numerator = "";
    String denominator = "";
    if (alternating != null) {
      numerator += "(-1)${"${alternating.compute(n, noCompute)}".makeSuper()}";
    }
    String xString = "${noCompute ? "x" : x}";
    numerator +=
        "($xString)${(exponent.compute(n, noCompute).toString()).makeSuper()}";
    if (factorial) {
      denominator += "(${this.bottom.compute(n, noCompute)})!";
    } else {
      denominator += this.bottom.compute(n, noCompute).toString();
    }
    return Fraction(numerator, denominator);
  }

  @override
  String toString() {
    return display.toString();
  }
}
