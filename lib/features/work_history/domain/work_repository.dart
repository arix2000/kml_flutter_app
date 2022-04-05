import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';

abstract class WorkRepository {
  Future<Either<Failure, List<WorkModel>>> fetchWorks();
}