import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';
import 'package:kml_flutter_app/features/work_history/domain/fetch_works_use_case.dart';
import 'package:meta/meta.dart';

part 'work_history_event.dart';

part 'work_history_state.dart';

class WorkHistoryBloc extends Bloc<WorkHistoryEvent, WorkHistoryState> {

  WorkHistoryBloc(this.fetchWork) : super(InitialWorkHistoryState());

  final FetchWorkUseCase fetchWork;

  @override
  Stream<WorkHistoryState> mapEventToState(WorkHistoryEvent event) async* {
    if (event is DataInitEvent) {
      yield Loading();
      final result = await fetchWork();
      yield result.fold(
              (failure) => Failed(failure.getErrorMessage()),
              (works) => Loaded(works));
    }
  }
}
