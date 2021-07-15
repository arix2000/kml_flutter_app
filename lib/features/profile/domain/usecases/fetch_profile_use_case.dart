import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';
import 'package:kml_flutter_app/features/profile/domain/profile_repository.dart';

class FetchProfileUseCase {
  final ProfileRepository repository;

  FetchProfileUseCase(this.repository);

  Future<Either<Failure, ProfileModel>> call(Params params) {
    return repository.fetchProfile(params.userId);
  }
}

class Params extends Equatable {
  final int userId;

  Params(this.userId): super();

  @override
  List<Object> get props => [userId];
}