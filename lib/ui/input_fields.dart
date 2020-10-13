import 'package:flutter/material.dart';
import 'package:smartest_calculator/ui/algorithm_text_field.dart';

class InputField {
  static IntegerTextField precision(String key, BuildContext context) {
    return IntegerTextField(key, context);
  }

  static DecimalTextField decimal(String key, BuildContext context) {
    return DecimalTextField(key, context);
  }
}
