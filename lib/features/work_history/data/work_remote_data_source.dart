import 'dart:convert';

import 'package:kml_flutter_app/core/Globals.dart';
import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/network/app_client.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';

const WORK_ENDPOINT = "getWorkHistory.php";

abstract class WorkRemoteDataSource {
  Future<List<WorkModel>> fetchWorks();
}

class WorkRemoteDataSourceImpl extends WorkRemoteDataSource {
  final AppClient httpClient;

  WorkRemoteDataSourceImpl(this.httpClient);

  @override
  Future<List<WorkModel>> fetchWorks() async {
    final body = {"firstName": Globals.fistName, "lastName": Globals.lastName};
    final response = await httpClient.post(
      Uri.parse(API_URL + WORK_ENDPOINT),
      body: body,
      encoding: Encoding.getByName(DEFAULT_ENCODING),
    );

    if (response.statusCode == 200)
      return getWorksFromJson(response.body);
    else
      throw ServerException(response);
  }

  List<WorkModel> getWorksFromJson(String jsonStr) {
    final Iterable worksJson = json.decode(jsonStr);
    List<WorkModel> works = List<WorkModel>.from(
        worksJson.map((jsonModel) => WorkModel.fromJson(jsonModel)));
    print(worksJson.toString());
    return works;
  }
}
