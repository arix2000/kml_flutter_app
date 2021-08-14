
import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/Constants.dart';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/login/domain/login_repository.dart';
import 'datasources/login_local_data_source.dart';
import 'datasources/login_remote_data_source.dart';
import 'login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this.remoteDataSource, this.networkInfo, this.localDataSource);

  @override
  Future<Either<Failure, String>> sendLogData(LoginModel loginData) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.sendLoginData(loginData);
        if (result.contains("true"))
          saveLoginData(loginData);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModel>> getSavedLoginData() async {
    try {
      final result = await localDataSource.getSavedLoginData();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  void saveLoginData(LoginModel loginData) {
    localDataSource.saveLoginData(loginData);
  }

}