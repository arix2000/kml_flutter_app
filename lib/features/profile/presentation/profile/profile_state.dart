part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  ProfileState([List props = const <dynamic>[]]);

  List<Object> get props => [props];
}

class InitialProfileState extends ProfileState {}

class Loading extends ProfileState {}

class Loaded extends ProfileState {
  final ProfileModel result;

  Loaded(this.result);
}

class Error extends ProfileState {
  final String message;

  Error(this.message);
}