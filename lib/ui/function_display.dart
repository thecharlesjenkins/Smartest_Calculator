import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/blocs/algorithm_bloc.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';

class FunctionDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AlgorithmBloc algorithmBloc = InjectorWidget
        .of(context)
        .algorithmBloc;
    return Column(
      key: UniqueKey(),
      children: <Widget>[
        algorithmBloc.resultDisplay,
        algorithmBloc.outputStepsDisplay,
        algorithmBloc.fields
      ],
    );
  }
}
