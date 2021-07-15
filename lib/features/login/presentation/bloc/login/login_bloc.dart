import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/login/data/login_model.dart';
import 'package:kml_flutter_app/features/login/domain/login_entity.dart';
import 'package:kml_flutter_app/features/login/domain/usecases/get_saved_log_data_use_case.dart';
import 'package:kml_flutter_app/features/login/domain/usecases/send_log_data_use_case.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendLogDataUseCase sendLogData;
  final GetSavedLogDataUseCase getSavedLogData;

  LoginBloc(this.sendLogData, this.getSavedLogData) : super(Empty());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is SendLogDataEvent) {
      yield Loading();
      final failureOrLogData = await sendLogData(Params(event.loginData));
      yield failureOrLogData.fold(
              (failure) => Error(failure.getErrorMessage()),
              (logResult) => Loaded(logResult)
      );
    } else if (event is GetLogDataEvent) {
      final failureOrData = await getSavedLogData();
      yield failureOrData.fold(
              (failure) => Error(failure.getErrorMessage()),
              (logData) => CacheLoaded(logData));
    }
  }
}
