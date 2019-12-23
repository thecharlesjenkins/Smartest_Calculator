import 'package:flutter/widgets.dart';
import 'package:smartest_calculator/blocs/bloc.dart';
import 'package:smartest_calculator/functions/algorithms/base_algorithm.dart';
import 'package:smartest_calculator/utils/output_display.dart';

class FunctionDisplay extends StatelessWidget {
  final Bloc<Algorithm> algorithmBloc;

  FunctionDisplay(this.algorithmBloc);

  Widget get fields {
    return StreamBuilder<Algorithm>(
        stream: algorithmBloc.getInput.asBroadcastStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.fields.length,
                itemBuilder: (context, index) {
                  return snapshot.data.fields[index];
                });
          }
          return EmptyOutputDisplay().resultDisplay;
        });
  }

  Widget get resultDisplay {
    return StreamBuilder<Algorithm>(
//      initialData: EmptyOutputDisplay(),
      stream: algorithmBloc.getInput,
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
        stream: algorithmBloc.getInput,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: <Widget>[resultDisplay, outputStepsDisplay, fields],
    );
  }
}
