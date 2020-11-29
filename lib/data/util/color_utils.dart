import 'package:flutter/painting.dart';

extension ToHexColor on Color {
  /// converts color to string without #
  String toHex() => value.toRadixString(16).padLeft(8, '0');
}

extension FromHexColor on String {
  /// converts string color (without #) to Color
  Color fromHex() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(this);
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
