//import 'dart:async';
//
//import 'package:decimal/decimal.dart';
//import 'package:smart_calculator/functions/algorithms/maclaurin/maclaurin.dart';
//import 'package:smart_calculator/utils/factorial.dart';
//import 'package:smart_calculator/utils/input.dart';
//import 'package:smart_calculator/utils/output.dart';
//import 'package:smart_calculator/utils/term_formatting.dart';
//
//class EPowX extends Maclaurin {
//  Stream<Input> input;
//  TermFormatting series = TermFormatting();
//
//  EPowX(this.input) : super(input);
//
//  Decimal maclaurinSeries(Decimal input, int n) => input.pow(n) / factorial(n);
//
//  Decimal maximumValue(Decimal x) => (Decimal.fromInt(3)).pow(x.toInt());
//
//  String toString() => 'e^x';
//
//  @override
//  // TODO: implement displayInput
//  bool get displayInput => null;
//
//  @override
//  // TODO: implement displayPrecision
//  bool get displayPrecision => null;
//
//  @override
//  // TODO: implement functionDescription
//  String get functionDescription => null;
//
//  @override
//  // TODO: implement generalDescription
//  String get generalDescription => null;
//
//  @override
//  // TODO: implement title
//  String get title => null;
//
//  @override
//  // TODO: implement output
//  Output get output => null;
//}
