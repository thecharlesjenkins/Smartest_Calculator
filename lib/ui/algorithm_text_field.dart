import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/ui/input_fields.dart';
import 'package:smartest_calculator/utils/decimal_extensions.dart';

class AlgorithmTextField<T> extends TextField implements Field {
  final TextEditingController controller;
  final Bloc<T> bloc;
  final key;

  AlgorithmTextField(
      this.key, this.controller, TextInputType keyboardType, this.bloc)
      : super(
            key: key,
            controller: controller,
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("^([0-9]+(\.[0-9]+)?)"))
            ],
            textInputAction: TextInputAction.done,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF0000))))) {
    controller.addListener(_fieldListener);
  }

  void _fieldListener() {
    if (controller.value.text != "") {
      addToBloc(controller.value.text);
    }
  }

  void addToBloc(String str) {
    bloc.update(controller.value.text as T);
  }
}

class DecimalTextField extends AlgorithmTextField<Decimal> {
  DecimalTextField(Key key, TextEditingController controller,
      TextInputType keyboardType, Bloc<Decimal> bloc)
      : super(key, controller, keyboardType, bloc);

  @override
  void addToBloc(String str) =>
      bloc.update(Parsing.parseDouble(double.parse(str)));
}

class IntegerTextField extends AlgorithmTextField<int> {
  IntegerTextField(Key key, TextEditingController controller,
      TextInputType keyboardType, Bloc<int> bloc)
      : super(key, controller, keyboardType, bloc);

  @override
  void addToBloc(String str) => bloc.update(int.parse(str));
}
