part of 'work_history_bloc.dart';

@immutable
abstract class WorkHistoryState {}

class InitialWorkHistoryState extends WorkHistoryState {}

class Loading extends WorkHistoryState {}
class Loaded extends WorkHistoryState {
  final List<WorkModel> works;

  Loaded(this.works);
}

class Failed extends WorkHistoryState {
  final String message;

  Failed(this.message);
}