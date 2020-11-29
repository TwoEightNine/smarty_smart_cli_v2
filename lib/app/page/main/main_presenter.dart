import 'package:flutter/painting.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:smarty_smart_cli_v2/data/repo/data_main_repo.dart';
import 'package:smarty_smart_cli_v2/domain/usecase/main_usecase.dart';

class MainPresenter extends Presenter {
  final GetStateUseCase getStateUseCase;
  final SetStateUseCase setStateUseCase;

  Function onStateLoaded;

  MainPresenter()
      : getStateUseCase = GetStateUseCase(DataMainRepo()),
        setStateUseCase = SetStateUseCase(DataMainRepo()),
        super();

  void loadState() {
    getStateUseCase.execute(_StateObserver(this), GetStateParams());
  }

  void updateLedColor(Color color) {
    setStateUseCase.execute(_StateObserver(this), SetStateParams(color));
  }

  @override
  void dispose() {
    getStateUseCase.dispose();
    setStateUseCase.dispose();
  }
}

class _StateObserver extends Observer<StateResponse> {
  final MainPresenter presenter;

  _StateObserver(this.presenter);

  @override
  void onNext(StateResponse response) {
    presenter.onStateLoaded(response.state);
  }

  @override
  void onError(e) {}

  @override
  void onComplete() {}
}
