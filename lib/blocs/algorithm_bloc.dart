import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
import 'package:smartest_calculator/utils/output_display.dart';

class AlgorithmBloc extends Bloc<Algorithm> {
  Widget get fields {
    return StreamBuilder<Algorithm>(
      stream: getInput.asBroadcastStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.inputs.display;
        }
        return EmptyOutputDisplay().resultDisplay;
      },
    );
  }

  Widget get resultDisplay {
    return StreamBuilder<Algorithm>(
      stream: getInput,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StreamBuilder<OutputDisplay>(
            stream: snapshot.data.bloc.getInput,
            builder: (cxt, snap) {
              if (snap.hasData) {
                return snap.data.resultDisplay;
              }
              return EmptyOutputDisplay().resultDisplay;
            },
          );
        }
        return EmptyOutputDisplay().resultDisplay;
      },
    );
  }

  Widget get outputStepsDisplay {
    return StreamBuilder<Algorithm>(
      stream: getInput,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StreamBuilder<OutputDisplay>(
            stream: snapshot.data.bloc.getInput,
            builder: (cxt, snap) {
              if (snap.hasData) {
                return snap.data.outputStepsDisplay;
              }
              return EmptyOutputDisplay().outputStepsDisplay;
            },
          );
        }
        return EmptyOutputDisplay().outputStepsDisplay;
      },
    );
  }
}
