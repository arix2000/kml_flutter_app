import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String joinYear;
  final String timeOfWorkSeason;
  final String sections;
  final String type;
  final String timeOfWorkMonth;

  ProfileEntity(this.firstName, this.lastName, this.joinYear,
      this.timeOfWorkSeason, this.sections, this.type, this.timeOfWorkMonth);

  @override
  List<Object> get props => [firstName, lastName, joinYear, timeOfWorkSeason,
        sections, type, timeOfWorkMonth];
}
