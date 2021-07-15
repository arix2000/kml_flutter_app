
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/login/data/login_model.dart';

import '../login_repository.dart';

class SendLogDataUseCase {
  final LoginRepository repository;

  SendLogDataUseCase(this.repository);

  Future<Either<Failure, String>> call(Params params) async {
    return await repository.sendLogData(params.login);
  }
}

class Params extends Equatable {
  final LoginModel login;

  Params(this.login): super();

  @override
  List<Object> get props => [login];
}