part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class Empty extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {
  final String result;

  Loaded(this.result);
}

class CacheLoaded extends LoginState {
  final LoginModel loginModel;

  CacheLoaded(this.loginModel);
}

class Error extends LoginState {
  final String message;

  Error(this.message);
}