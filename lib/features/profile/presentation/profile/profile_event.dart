part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const <dynamic>[]]);

  List<Object> get props => [props];
}

class FetchProfileEvent extends ProfileEvent {
  final int userId;

  FetchProfileEvent(this.userId): super([userId]);
}

class OpenChangePassDialogEvent extends ProfileEvent {}
