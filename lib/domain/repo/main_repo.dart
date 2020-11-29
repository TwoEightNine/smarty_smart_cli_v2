import 'package:flutter/painting.dart';
import 'package:smarty_smart_cli_v2/domain/entity/state.dart';

abstract class MainRepo {

  Future<State> getState();
  Future<State> setColor(Color color);

}