import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';
import 'package:kml_flutter_app/features/profile/domain/usecases/fetch_profile_use_case.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchProfileUseCase fetchProfileUseCase;

  ProfileBloc(this.fetchProfileUseCase) : super(InitialProfileState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileEvent) {
      yield Loading();
      final failureOrProfileModel =
          await fetchProfileUseCase(Params(event.userId));
      yield failureOrProfileModel.fold(
              (failure) => Error(failure.getErrorMessage()),
              (profileModel) => Loaded(profileModel));
    } else if (event is OpenChangePassDialogEvent) {
      yield OpenDialogState();
    }
  }
}
