import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';
import 'package:kml_flutter_app/features/work_history/data/work_remote_data_source.dart';
import 'package:kml_flutter_app/features/work_history/domain/work_repository.dart';

class WorkRepositoryImpl implements WorkRepository {
  final WorkRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WorkRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<WorkModel>>> fetchWorks() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.fetchWorks());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
