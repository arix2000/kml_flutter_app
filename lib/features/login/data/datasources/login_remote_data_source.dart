import '../login_model.dart';

const LOGIN_ENDPOINT = "login.php";

abstract class LoginRemoteDataSource {
  Future<String> sendLoginData(LoginModel login);
}