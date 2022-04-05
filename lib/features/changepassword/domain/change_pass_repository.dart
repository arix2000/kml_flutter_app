
import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_model.dart';

abstract class ChangePassRepository {

  Future<Either<Failure, bool>> changePass(ChangePassModel model);
}