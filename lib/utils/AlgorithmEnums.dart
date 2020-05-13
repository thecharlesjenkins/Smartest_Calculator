import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smartest_calculator/functions/algorithms/maclaurin/maclaurin.dart';

enum AlgorithmEnums { Sine, Cosine, EPowX }

ColorSwatch maclaurinColor = ColorSwatch(Colors.blue.value, {'appBar': Colors.blue[800]});

Map<AlgorithmEnums, List<dynamic>> algorithmMap = {
  AlgorithmEnums.Sine: [
    maclaurinColor,
    "Sin"
  ],
  AlgorithmEnums.Cosine: [
    maclaurinColor,
    "Cos"
  ],
  AlgorithmEnums.EPowX: [
    maclaurinColor,
    "eˣ"
  ],
};
