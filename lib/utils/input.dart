import 'package:decimal/decimal.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smartest_calculator/blocs/result_bloc.dart';
import 'package:smartest_calculator/ui/input_fields.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';

abstract class Input {
  final Map<String, dynamic> _inputMap;

  Input.fromMap(Map<String, dynamic> map) : _inputMap = map;

  Map newInput(String id, dynamic input) {
    assert(_inputMap[id].runtimeType == input.runtimeType);
    _inputMap[id] = input;
    return _inputMap;
  }
}

@immutable
class DecimalPrecisionInput extends Input {
  Decimal get input => _inputMap[inputKey];

  int get precision => _inputMap[precisionKey];

  DecimalPrecisionInput.fromMap(Map<String, dynamic> map) : super.fromMap(map);

  DecimalPrecisionInput(Decimal input, int precision)
      : super.fromMap({inputKey: input, precisionKey: precision});

  static Map<String, dynamic> map = {"1": Decimal.zero, "2": 5};
  static String inputKey = "1";
  static String precisionKey = "2";
}

class InputBloc {
  final ResultBloc _resultBloc;

  final Map inputs = DecimalPrecisionInput.map;

  InputBloc(BuildContext context)
      : _resultBloc = InjectorWidget.of(context).resultBloc;

  void update(String id, dynamic input) {
    inputs[id] = input;
    _resultBloc.updateInput(id, input);
  }
}

class DecimalPrecisionInputFormat extends StatelessWidget {
  final Map inputs = DecimalPrecisionInput.map;

  void update(BuildContext context, String id, dynamic input) {
    inputs[id] = input;
    InjectorWidget.of(context).resultBloc.updateInput(id, input);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputField.precision(DecimalPrecisionInput.precisionKey, context),
        InputField.decimal(DecimalPrecisionInput.inputKey, context),
      ],
    );
  }
}

extension NotifyAdd on Map<String, dynamic> {
  void notifyAdd(String key, dynamic value, ResultBloc resultBloc) {}
}

//abstract class GeneralInput {
//  Widget get display;
//
//  void dispose();
//}
//
//class AlgorithmInput extends GeneralInput {
//  ResultBloc resultBloc;
//
//  AlgorithmInput() {
//    _decimalField.controller.addListener(_listener);
//    _precisionField.controller.addListener(_listener);
//  }
//
//  void _listener() {
//    resultBloc.update(DecimalPrecisionInput(input, precision));
//  }
//
//  final DecimalTextField _decimalField = InputField.decimal;
//  final IntegerTextField _precisionField = InputField.precision;
//
//  Decimal get input => _decimalField.bloc.subject.value;
//
//  int get precision => _precisionField.bloc.subject.value;
//
//  Widget get display {
//    _decimalField.controller.text = input.toString();
//    _precisionField.controller.text = precision.toString();
//
//    return ListView(
//      children: <Widget>[_decimalField, _precisionField],
//    );
//  }
//
//  @override
//  void dispose() {
//    _decimalField.bloc.dispose();
//    _precisionField.bloc.dispose();
//  }
//}
