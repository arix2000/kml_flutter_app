import 'dart:convert';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/network/app_client.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final AppClient httpClient;

  ProfileRemoteDataSourceImpl(this.httpClient);

  @override
  Future<ProfileModel> fetchProfile(int userId) async {
    final body = {"loginId": userId.toString()};
    final response = await httpClient.post(
        Uri.parse(API_URL + PROFILE_ENDPOINT),
        body: body,
        encoding: Encoding.getByName(DEFAULT_ENCODING));

    if (response.statusCode == 200)
      return ProfileModel.fromJson(response.body);
    else
      throw ServerException(response);
  }
}
