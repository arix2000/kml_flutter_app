
import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> fetchProfile(int userId);
}