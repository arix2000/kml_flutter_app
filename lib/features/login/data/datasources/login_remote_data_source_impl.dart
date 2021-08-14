import 'dart:convert';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/network/app_client.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import '../login_model.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final AppClient httpClient;

  LoginRemoteDataSourceImpl(this.httpClient);
  @override
  Future<String> sendLoginData(LoginModel login) async {
    final body = _createBodyMap(login);
    final response = await httpClient.post(
        Uri.parse(API_URL+LOGIN_ENDPOINT),
        body: body,
        encoding: Encoding.getByName(DEFAULT_ENCODING)
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException(response);
    }
  }

  Map<String,String> _createBodyMap(LoginModel login) {
    return {
      "user":login.login,
      "pass":login.password
    };
  }
}