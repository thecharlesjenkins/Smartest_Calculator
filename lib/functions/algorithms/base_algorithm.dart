import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/utils/formatting/output_formatting.dart';
import 'package:smartest_calculator/utils/input.dart';
import 'package:smartest_calculator/utils/output_display.dart';

abstract class Algorithm<T extends Input> {
  String get title;

  ColorSwatch get color;

  String get generalDescription;

  String get functionDescription;

  Widget get output;

  Input initialInput;

  OutputFormatting get outputFormatting;

  T get previousInput;

  bool selected = false;

  Stream<OutputDisplay> computeFunction(T input);
}
