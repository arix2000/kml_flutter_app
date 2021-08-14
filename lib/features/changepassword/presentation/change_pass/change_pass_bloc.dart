import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_model.dart';
import 'package:kml_flutter_app/features/changepassword/domain/change_pass_use_case.dart';
import 'package:kml_flutter_app/features/maincontainer/main_container.dart';
import 'package:meta/meta.dart';

part 'change_pass_event.dart';

part 'change_pass_state.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  final ChangePassUseCase changePassUseCase;

  ChangePassBloc(this.changePassUseCase) : super(InitialChangePassState());

  @override
  Stream<ChangePassState> mapEventToState(ChangePassEvent event) async* {
    if (event is ChangePassClickedEvent) {
      yield Loading();
      final result = await changePassUseCase.call(
          ChangePassModel(event.oldPass, event.newPass, MainContainer.loginId));
      yield result.fold((failure) => Failed(failure.getErrorMessage()),
          (result) => _resolveResult(result));
    } else if (event is ValidationFailedEvent) {
      yield ValidationFailed();
    }
  }

  ChangePassState _resolveResult(bool result) {
    if (result) {
      return Loaded();
    } else {
      return PassChangeFailed();
    }
  }
}
