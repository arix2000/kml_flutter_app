part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]);

  List<Object> get props => [props];
}

class SendLogDataEvent extends LoginEvent {
  final LoginEntity loginData;

  SendLogDataEvent(this.loginData): super([loginData]);
}

class GetLogDataEvent extends LoginEvent {
  GetLogDataEvent(): super();
}

class SaveLogDataEvent extends LoginEvent {
  final LoginEntity loginData;

  SaveLogDataEvent(this.loginData): super([loginData]);
}
