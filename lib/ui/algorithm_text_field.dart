import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartest_calculator/utils/decimal_extensions.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';

abstract class AlgorithmTextField<T> extends TextField {
  final TextEditingController controller;
  final BuildContext context;
  final String id;

  AlgorithmTextField(
      this.id, this.controller, TextInputType keyboardType, this.context)
      : super(
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("^([0-9])|(\.)"))
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
    if (controller.value != null) {
      InjectorWidget.of(context)
          .resultBloc
          .updateInput(id, convertText(controller.value.text));
    }
  }

  T convertText(String str);
}

class DecimalTextField extends AlgorithmTextField<Decimal> {
  DecimalTextField(String id, BuildContext context)
      : super(id, TextEditingController(), TextInputType.number, context);

  Decimal convertText(String str) => Parsing.parseDouble(double.parse(str));
}

class IntegerTextField extends AlgorithmTextField<int> {
  IntegerTextField(String id, BuildContext context)
      : super(id, TextEditingController(), TextInputType.number, context);

  int convertText(String str) => int.parse(str);
}
