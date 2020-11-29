import 'dart:ui';
import 'package:smarty_smart_cli_v2/data/repo/base_repo.dart';
import 'package:smarty_smart_cli_v2/domain/entity/state.dart';
import 'package:smarty_smart_cli_v2/domain/repo/main_repo.dart';
import 'package:smarty_smart_cli_v2/data/util/color_utils.dart';

class DataMainRepo extends BaseRepo implements MainRepo {
  @override
  Future<State> getState() async {
    return _fromJson(await baseGet('state'));
  }

  @override
  Future<State> setColor(Color color) async {
    String color6Hex = color.toHex().substring(2);
    return _fromJson(await baseGet('led_color?color=' + color6Hex));
  }

  State _fromJson(Map<String, dynamic> json) {
    return State(
        ledColor: (json['led_color'] as String).fromHex(),
        temperature: double.parse(json['temp'])
    );
  }
}