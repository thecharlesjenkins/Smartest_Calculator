import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/blocs/result_bloc.dart';
import 'package:smartest_calculator/blocs/unified_bloc.dart';

class InjectorWidget extends InheritedWidget {
  final UnifiedBloc unifiedBloc = UnifiedBloc();
  final ResultBloc resultBloc = ResultBloc();

  InjectorWidget({@required Widget child})
      : assert(child != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InjectorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InjectorWidget>();
  }
}
