import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

abstract class BaseUseCase<T, Params> extends UseCase<T, Params> {
  /// the main logic of use case should be defined here
  /// this code is wrapped with try-catch block
  /// returned value will be passed to controlled
  /// in case of error exception should be thrown
  Future<T> doUseCase(Params params);

  @override
  Future<Stream<T>> buildUseCaseStream(Params params) async {
    final controller = StreamController<T>();
    try {
      controller.add(await doUseCase(params));
      controller.close();
    } catch (e, stackTrace) {
      print('$e\n$stackTrace');
      controller.addError(e);
    }
    return controller.stream;
  }
}