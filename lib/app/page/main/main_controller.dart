import 'package:flutter/painting.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:smarty_smart_cli_v2/app/page/main/main_presenter.dart';
import 'package:smarty_smart_cli_v2/domain/entity/state.dart';

class MainController extends Controller {
  final MainPresenter presenter;
  State state;

  MainController()
      : presenter = MainPresenter(),
        super();

  void loadState() => presenter.loadState();

  void setLedColor(Color color) => presenter.updateLedColor(color);

  @override
  void initListeners() {
    presenter.onStateLoaded = (State state) {
      this.state = state;
      refreshUI();
    };
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}
