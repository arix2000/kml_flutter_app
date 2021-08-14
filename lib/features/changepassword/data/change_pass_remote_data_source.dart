import 'dart:convert';

import 'package:kml_flutter_app/core/error/exceptions.dart';
import 'package:kml_flutter_app/core/network/app_client.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_model.dart';

const CHANGE_PASS_ENDPOINT = "changePass.php";

abstract class ChangePassRemoteDataSource {
  Future<bool> changePass(ChangePassModel model);
}

class ChangePassRemoteDataSourceImpl extends ChangePassRemoteDataSource {
  final AppClient httpClient;

  ChangePassRemoteDataSourceImpl(this.httpClient);

  @override
  Future<bool> changePass(ChangePassModel model) async {
    final response = await httpClient.post(
      Uri.parse(API_URL + CHANGE_PASS_ENDPOINT),
      body: model.toJson(),
      encoding: Encoding.getByName(DEFAULT_ENCODING),
    );

    if (response.statusCode == 200) {
      print(model.toJson().toString());
      print(response.body);
      return response.body.contains('true');
    } else {
      throw ServerException(response);
    }
  }
}
