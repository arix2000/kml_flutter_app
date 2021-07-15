import 'dart:convert';

import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_model.dart';
import 'login_local_data_source.dart';

const LOGIN_MODEL_KEY = "LOGIN_MODEL_KEY";

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveLoginData(LoginModel login) async {
    return sharedPreferences.setString(LOGIN_MODEL_KEY, jsonEncode(login.toJson()));
  }

  @override
  Future<LoginModel> getSavedLoginData() async {
    final json = sharedPreferences.getString(LOGIN_MODEL_KEY);
    if (json.isNotEmpty)
      return LoginModel.fromJson(json);
    else
      throw CacheException();
  }
}
