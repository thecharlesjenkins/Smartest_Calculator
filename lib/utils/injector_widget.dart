import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';

class InjectorWidget extends InheritedWidget {
  final Bloc<Algorithm> algorithmBloc = Bloc<Algorithm>();

  InjectorWidget({@required Widget child})
      : assert(child != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InjectorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InjectorWidget>();
  }
}
