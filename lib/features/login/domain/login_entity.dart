
import 'package:equatable/equatable.dart';

abstract class LoginEntity extends Equatable {
  final String login;
  final String password;

  LoginEntity(this.login, this.password);

  @override
  List<Object> get props => [login, password];
}