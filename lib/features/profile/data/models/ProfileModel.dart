import 'dart:convert';
import 'package:kml_flutter_app/features/profile/domain/entities/ProfileEntity.dart';

class ProfileModel extends ProfileEntity {
  final String firstName;
  final String lastName;
  final String joinYear;
  final String timeOfWorkSeason;
  final String sections;
  final String type;
  final String timeOfWorkMonth;

  ProfileModel(this.firstName, this.lastName, this.joinYear,
      this.timeOfWorkSeason, this.sections, this.type, this.timeOfWorkMonth)
      : super(firstName, lastName, joinYear, timeOfWorkSeason, sections, type,
            timeOfWorkMonth);

  factory ProfileModel.fromJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    return ProfileModel(
      jsonMap['imie'],
      jsonMap['nazwisko'],
      jsonMap['dataDolaczenia'],
      jsonMap['czasPracy'],
      jsonMap['sekcje'],
      jsonMap['typ'],
      jsonMap['czasPracyMiesiac'],
    );
  }
}
