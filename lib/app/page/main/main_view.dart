import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:smarty_smart_cli_v2/app/page/main/main_controller.dart';
import 'package:smarty_smart_cli_v2/app/widget/appbar.dart';
import 'package:smarty_smart_cli_v2/app/widget/button.dart';
import 'package:smarty_smart_cli_v2/app/widget/color_picker.dart';

class MainPage extends View {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends ViewState<MainPage, MainController> {
  _MainPageState() : super(MainController());

  @override
  Widget get view {
    return ControlledWidgetBuilder<MainController>(
      builder: (context, controller) {
          if (controller.state == null) {
            controller.loadState();
            return createPage(Colors.black);
          } else {
            return createPage(controller.state.ledColor);
          }
      },
    );
  }

  Widget createPage(Color color) => Scaffold(
      backgroundColor: Colors.white,
      appBar: SmartyAppBar(
        titleText: 'Smarty Smart',
      ),
      body: Column(
        children: [
          createColorPicker(color),
          createTurnOffButton(),
        ],
      ));

  Widget createTurnOffButton() =>
      ControlledWidgetBuilder<MainController>(builder: (context, controller) {
        return SmartyRaisedButton(
          text: 'Turn off',
          onClick: () => controller.setLedColor(Colors.black),
        );
      });

  Widget createColorPicker(Color color) =>
      ControlledWidgetBuilder<MainController>(builder: (context, controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.0),
              width: 260,
              child: SmartyColorPicker(
                  pickerColor: color,
                  onColorChanged: (color) => controller.setLedColor(color)),
            )
          ],
        );
      });
}
