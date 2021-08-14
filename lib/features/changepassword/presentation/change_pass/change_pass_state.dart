part of 'change_pass_bloc.dart';

@immutable
abstract class ChangePassState {}

class InitialChangePassState extends ChangePassState {}

class Loading extends ChangePassState {}

class Loaded extends ChangePassState {}

class PassChangeFailed extends ChangePassState {}

class ValidationFailed extends ChangePassState {}

class Failed extends ChangePassState {
  final String message;

  Failed(this.message);
}