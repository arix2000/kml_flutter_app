import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/login/data/login_model.dart';
import '../login_repository.dart';

class GetSavedLogDataUseCase {
  final LoginRepository repository;

  GetSavedLogDataUseCase(this.repository);

  Future<Either<Failure, LoginModel>> call() {
    return repository.getSavedLoginData();
  }
}