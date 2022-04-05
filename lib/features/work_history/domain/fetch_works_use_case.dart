import 'package:dartz/dartz.dart';
import 'package:kml_flutter_app/core/error/failures.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';
import 'package:kml_flutter_app/features/work_history/domain/work_repository.dart';

class FetchWorkUseCase {
  final WorkRepository repository;

  FetchWorkUseCase(this.repository);

  Future<Either<Failure, List<WorkModel>>> call() {
   return repository.fetchWorks();
  }
}