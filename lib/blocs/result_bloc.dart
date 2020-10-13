import 'package:rxdart/rxdart.dart';
import 'package:smartest_calculator/utils/input.dart';
import 'package:smartest_calculator/utils/output_display.dart';

class ResultBloc {
  Function compute;

  var _controller = BehaviorSubject();

  Stream<OutputDisplay> listenToOutput() async* {
    await for (var item in _controller) {
      print(item);
      var computed = compute(item);
      print("computed");
      yield* compute(item);
    }
//    _controller.map((input) {
//      var computed = compute(input);
//      print(computed);
//      return computed;
//    });
  }

  ///[input] is a list with two items that relate to inputs to the calculator.
  ///Item zero is a key that corresponds to the input. Item one is the new value
  ///for that input.
  void updateInput(String id, dynamic input) {
    _controller.sink.add(_controller.value.newInput(id, input));
  }

  void updateAlgorithm(
      Stream<OutputDisplay> function(dynamic input), dynamic input) {
    compute = function;
    _controller.sink.add(input);
  }

  void dispose() {
    _controller.close();
  }
}
