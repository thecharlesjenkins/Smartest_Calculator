import 'package:decimal/decimal.dart';

Decimal toDecimalPrecision(int numberOfDecimalPlaces) {
  String decimal = "." + "0" * numberOfDecimalPlaces + "1";
  return Decimal.parse(decimal);
}

//Todo: Only works while error and number are under 1
int numDecimalPlaces(Decimal error, Decimal number) {
  Decimal min = (number - error);
  Decimal minTruncated = min.truncate();
  String minStrings = (min - minTruncated).toString();

  Decimal numberTruncated = number.truncate();
  String numStrings = (number - numberTruncated).toString();

  int numPlaces = 0;

  int length = minStrings.length < numStrings.length
      ? minStrings.length
      : numStrings.length;

  for (int i = 1; i < length; i++) {
    if (minStrings[i] == numStrings[i]) {
      numPlaces++;
    } else {
      return numPlaces - 1;
    }
  }

  return numPlaces;
}

String writeAsPrecision(Decimal decimal, int precision) {
  int decimalLength = (decimal - decimal.truncate()).toString().length;
  String truncatedDecimal = decimal.toStringAsPrecision(precision + 5);
  return truncatedDecimal
      .substring(0, truncatedDecimal.length - 5)
      .padRight(precision - decimalLength - 1);
}
