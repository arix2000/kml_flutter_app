
import 'dart:convert';

import 'package:kml_flutter_app/features/login/domain/login_entity.dart';

class LoginModel extends LoginEntity {
  final String login;
  final String password;

  LoginModel(this.login, this.password): super(login, password);

  Map toJson() => {
    'login': login,
    'password': password
  };

  factory LoginModel.fromJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    return LoginModel(jsonMap['login'], jsonMap['password']);
  }
}