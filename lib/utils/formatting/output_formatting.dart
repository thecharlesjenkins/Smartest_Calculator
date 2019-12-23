import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

abstract class OutputFormatting {
  ///Does not evaluate, just returns a widget that can represent
  ///the calculations for a specific output.
  ///[x] is the value at which to display the output.
  ///[n] is a secondary variable that can be utilized.
  ///[noCompute] when true should make it so that no part of the equation is
  ///evaluated, but is displayed in the least simplified form.
  Widget display(Decimal x, int n, {bool noCompute = false});
}
