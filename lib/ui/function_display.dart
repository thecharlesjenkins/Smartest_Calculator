import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';

class FunctionDisplay extends StatelessWidget {
//  Widget fields(FieldBloc fieldBloc) {
//    return StreamBuilder<Widget>(
//      stream: fieldBloc.getOutput,
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          return snapshot.data;
//        }
//        return EmptyOutputDisplay().resultDisplay;
//      },
//    );
//  }
//
//  Widget resultDisplay(ResultBloc resultBloc) {
//    return StreamBuilder<Widget>(
//      stream: resultBloc.getOutput,
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          return snapshot.data;
//        }
//        return EmptyOutputDisplay().resultDisplay;
//      },
//    );
//  }
//
//  Widget outputStepsDisplay(ResultBloc resultBloc) {
//    return StreamBuilder<Widget>(
//      stream: resultBloc.outputDisplay,
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          return snapshot.data;
//        }
//        return EmptyOutputDisplay().resultDisplay;
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Widget>(
      stream: InjectorWidget.of(context).unifiedBloc.getOutput,
      initialData: Container(),
      builder: (context, snapshot) {
        return snapshot.data;
      },
    );
  }
}
