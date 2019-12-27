import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartest_calculator/ui/algorithm_text_field.dart';
import 'package:smartest_calculator/ui/input_fields.dart';

class Input {
  Decimal input;
  int precision;

  Input(this.input, this.precision);
}

abstract class GeneralInput {
  Widget get display;

  void dispose();
}

class AlgorithmInput extends GeneralInput {
  final DecimalTextField _decimalField = InputField.decimal;
  final IntegerTextField _precisionField = InputField.precision;

  Decimal get input => _decimalField.bloc.subject.value;

  int get precision => _precisionField.bloc.subject.value;

  Widget get display {
    _decimalField.controller.text = input.toString();
    _precisionField.controller.text = precision.toString();

    return ListView(
      children: <Widget>[_decimalField, _precisionField],
    );
  }

  @override
  void dispose() {
    _decimalField.bloc.dispose();
    _precisionField.bloc.dispose();
  }
}
