import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_pass_event.dart';

part 'change_pass_state.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  ChangePassBloc() : super(InitialChangePassState());

  @override
  Stream<ChangePassState> mapEventToState(ChangePassEvent event) async* {
    // TODO: Add your event logic
  }
}
