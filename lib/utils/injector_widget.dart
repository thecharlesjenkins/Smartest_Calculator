import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/blocs/algorithm_bloc.dart';

class InjectorWidget extends InheritedWidget {
  final AlgorithmBloc algorithmBloc = AlgorithmBloc();

  InjectorWidget({@required Widget child})
      : assert(child != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InjectorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InjectorWidget>();
  }
}
