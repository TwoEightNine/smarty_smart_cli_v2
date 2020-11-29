import 'package:flutter/painting.dart';
import 'package:smarty_smart_cli_v2/domain/entity/state.dart';
import 'package:smarty_smart_cli_v2/domain/repo/main_repo.dart';
import 'package:smarty_smart_cli_v2/domain/usecase/base_usecase.dart';

class GetStateUseCase extends BaseUseCase<StateResponse, GetStateParams> {
  final MainRepo repo;

  GetStateUseCase(this.repo);

  @override
  Future<StateResponse> doUseCase(GetStateParams params) async =>
      StateResponse(await repo.getState());
}

class SetStateUseCase extends BaseUseCase<StateResponse, SetStateParams> {
  final MainRepo repo;

  SetStateUseCase(this.repo);

  @override
  Future<StateResponse> doUseCase(SetStateParams params) async =>
      StateResponse(await repo.setColor(params.color));
}

class StateResponse {
  final State state;

  StateResponse(this.state);
}

class GetStateParams {}

class SetStateParams {
  final Color color;

  SetStateParams(this.color);
}