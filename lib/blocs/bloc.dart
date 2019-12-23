import 'dart:async';

class Bloc<T> {
  final StreamController<T> controller = StreamController<T>.broadcast();

  Stream<T> get getInput => controller.stream.asBroadcastStream();

  void update(T input) {
    controller.sink.add(input);
  }

  void dispose() {
    controller.close();
  }
}
