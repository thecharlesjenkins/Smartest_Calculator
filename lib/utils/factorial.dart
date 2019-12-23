import 'package:decimal/decimal.dart';

Decimal factorial(int x) => Decimal.fromInt(x) == Decimal.zero
    ? Decimal.one
    : Decimal.fromInt(x) * factorial(x - 1);
