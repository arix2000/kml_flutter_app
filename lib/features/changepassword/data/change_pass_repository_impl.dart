import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_model.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_remote_data_source.dart';
import 'package:kml_flutter_app/features/changepassword/domain/change_pass_repository.dart';

class ChangePassRepositoryImpl implements ChangePassRepository {
  final NetworkInfo networkInfo;
  final ChangePassRemoteDataSource dataSource;

  ChangePassRepositoryImpl(this.networkInfo, this.dataSource);

  @override
  Future<Either<Failure, bool>> changePass(ChangePassModel model) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.changePass(model);
        return Right(result);
      } on ServerException {

        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}