import 'package:decimal/decimal.dart';
import 'package:smartest_calculator/functions/algorithms/maclaurin/maclaurin.dart';
import 'package:smartest_calculator/utils/factorial.dart';
import 'package:smartest_calculator/utils/formatting/output_formatting.dart';
import 'package:smartest_calculator/utils/series/term_formatting.dart';
import 'package:smartest_calculator/utils/series/term_piece.dart';

class Sine extends Maclaurin {
  Sine() : super();

  @override
  OutputFormatting get outputFormatting {
    return TermFormatting(
        alternating: TermPiece("n", (int n) => n),
        exponent: TermPiece("2n+1", (int n) => 2 * n + 1),
        bottom: TermPiece("2n+1", (int n) => 2 * n + 1),
        factorial: true);
  }

  @override
  Decimal maclaurinSeries(Decimal input, int n) =>
      Decimal.fromInt(-1).pow(n) * input.pow(2 * n + 1) / factorial(2 * n + 1);

  @override
  Decimal maximumValue(Decimal x) => Decimal.one;

  @override
  // TODO: implement functionDescription
  String get functionDescription => null;

  @override
  // TODO: implement generalDescription
  String get generalDescription => null;

  String get title => "sin";

  @override
  bool selected = false;
}
