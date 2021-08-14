import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_model.dart';
import 'package:kml_flutter_app/features/changepassword/domain/change_pass_repository.dart';

class ChangePassUseCase {
  final ChangePassRepository repository;

  ChangePassUseCase(this.repository);

  Future<Either<Failure, bool>> call(ChangePassModel model) async {
    return await repository.changePass(model);
  }
}