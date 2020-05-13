import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
import 'package:smartest_calculator/functions/algorithms/maclaurin/cosine.dart';
import 'package:smartest_calculator/functions/algorithms/maclaurin/sine.dart';
import 'package:smartest_calculator/utils/AlgorithmEnums.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';
final List<AlgorithmEnums> list = [AlgorithmEnums.Sine, AlgorithmEnums.Cosine, AlgorithmEnums.EPowX];

class FunctionList extends StatefulWidget {
  @override
  _FunctionListState createState() => _FunctionListState();
}

class _FunctionListState extends State<FunctionList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> get widgetList {
    return list
        .map((algorithm) => OutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderSide: BorderSide(color: algorithmMap[algorithm][0]),
            onPressed: () => addToBloc(_getAlgorithmInstance(algorithm)),
            child: Text(algorithmMap[algorithm][1])))
        .toList();
  }

  Algorithm _getAlgorithmInstance(AlgorithmEnums algorithmEnum) {
      switch (algorithmEnum) {
        case AlgorithmEnums.Sine:
          return Sine();
          break;
        case AlgorithmEnums.Cosine:
          return Cosine();
          break;
        case AlgorithmEnums.EPowX:
          throw UnimplementedError("e to an exponent not yet implemented");
          break;
      }
  }

  void addToBloc(Algorithm algorithm) {
    InjectorWidget.of(context).algorithmBloc.update(algorithm);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: widgetList,
    );
  }
}
