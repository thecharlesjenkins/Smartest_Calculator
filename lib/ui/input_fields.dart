import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/ui/algorithm_text_field.dart';

abstract class Field extends Widget {
  ValueNotifier get controller;

  Bloc get bloc;
}

class InputField {
  static final precision = IntegerTextField(UniqueKey(),
      TextEditingController(), TextInputType.number, Bloc<int>.seeded(5));
  static final decimal = DecimalTextField(
      UniqueKey(),
      TextEditingController(),
      TextInputType.numberWithOptions(decimal: true, signed: true),
      Bloc<Decimal>.seeded(Decimal.zero));
}
