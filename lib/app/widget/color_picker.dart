

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SmartyColorPicker extends ColorPicker {


  SmartyColorPicker({Color pickerColor, ValueChanged<Color> onColorChanged}) : super(
      pickerColor: pickerColor,
      onColorChanged: onColorChanged,
      showLabel: false,
      enableAlpha: false,
      pickerAreaHeightPercent: 1.6,
      displayThumbColor: true,
      colorPickerWidth: 260,
      pickerAreaBorderRadius: BorderRadius.all(Radius.circular(12.0))
  );

}