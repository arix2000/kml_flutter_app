
import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/login/data/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> sendLogData(LoginModel loginData);

  void saveLoginData(LoginModel loginData);

  Future<Either<Failure, LoginModel>> getSavedLoginData();
}