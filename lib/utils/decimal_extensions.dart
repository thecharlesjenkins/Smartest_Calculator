import 'package:decimal/decimal.dart';

extension Parsing on Decimal {
  static Decimal parseDouble(double number) {
    int first = number.toInt();
    double afterDecimal = number - first;
    int numDecimals = afterDecimal.toString().length - 2;
    Decimal concat = Decimal.fromInt(first) +
        Decimal.fromInt((afterDecimal * numDecimals).toInt());
    return concat / Decimal.fromInt(numDecimals);
  }
}
