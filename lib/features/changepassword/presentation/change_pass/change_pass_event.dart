part of 'change_pass_bloc.dart';

@immutable
abstract class ChangePassEvent {}

class ChangePassFailedEvent extends ChangePassEvent {
  final String message;

  ChangePassFailedEvent(this.message);
}

class ChangePassSuccessfulEvent extends ChangePassEvent {}
