import 'package:decimal/decimal.dart';
import 'package:smartest_calculator/utils/factorial.dart';
import 'package:smartest_calculator/utils/formatting/output_formatting.dart';
import 'package:smartest_calculator/utils/series/term_formatting.dart';
import 'package:smartest_calculator/utils/series/term_piece.dart';

import 'maclaurin.dart';

class Cosine extends Maclaurin {
  @override
  OutputFormatting get outputFormatting {
    return TermFormatting(
        alternating: TermPiece("n", (int n) => n),
        exponent: TermPiece("2n", (int n) => 2 * n + 1),
        bottom: TermPiece("2n", (int n) => 2 * n + 1),
        factorial: true);
  }

  @override
  Decimal maclaurinSeries(Decimal input, int n) =>
      Decimal.fromInt(-1).pow(n) * input.pow(2 * n) / factorial(2 * n);

  @override
  Decimal maximumValue(Decimal x) => Decimal.one;

  @override
  // TODO: implement functionDescription
  String get functionDescription => null;

  @override
  // TODO: implement generalDescription
  String get generalDescription => null;

  String get title => "cos";

  @override
  bool selected = false;
}
