part of 'change_pass_bloc.dart';

@immutable
abstract class ChangePassEvent {}

class ChangePassClickedEvent extends ChangePassEvent {
  final String oldPass;
  final String newPass;

  ChangePassClickedEvent(this.oldPass, this.newPass);
}

class ValidationFailedEvent extends ChangePassEvent {}
