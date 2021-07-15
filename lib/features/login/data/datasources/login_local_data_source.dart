import '../login_model.dart';

abstract class LoginLocalDataSource {
  void saveLoginData(LoginModel login);

  Future<LoginModel> getSavedLoginData();
}