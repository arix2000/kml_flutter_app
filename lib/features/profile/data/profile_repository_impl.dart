
import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';
import 'package:kml_flutter_app/features/profile/domain/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, ProfileModel>> fetchProfile(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.fetchProfile(userId);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

}