import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
import 'package:smartest_calculator/functions/algorithms/maclaurin/sine.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';
import 'package:smartest_calculator/utils/series/polynomial.dart';

final List<Algorithm> list = [Sine(Bloc<Polynomial>())];

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
            borderSide: BorderSide(color: algorithm.color),
            onPressed: () => addToBloc(algorithm),
            child: Text(algorithm.title)))
        .toList();
  }

  void addToBloc(Algorithm algorithm) {
    InjectorWidget.of(context).algorithmBloc.update(algorithm);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgetList,
    );
  }
}
