
import 'package:kml_flutter_app/features/work_history/domain/work_entity.dart';

class WorkModel extends WorkEntity {
  final String workName;
  final String workDescription;
  final String workDate;
  final String executionTime;

  WorkModel(
      this.workName, this.workDescription, this.workDate, this.executionTime)
      : super(workName, workDescription, workDate, executionTime);

  factory WorkModel.fromJson(jsonMap) {
    return WorkModel(jsonMap['nazwaZadania'], jsonMap['opisZadania'],
        jsonMap['data'], jsonMap['czasWykonania']);
  }
}
