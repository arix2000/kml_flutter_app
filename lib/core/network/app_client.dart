import 'package:http/http.dart' as http;
import 'package:kml_flutter_app/core/network/network_info.dart';

class AppClient extends http.BaseClient{
  http.Client _httpClient = new http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(getDefaultHeaders());
    return _httpClient.send(request);
  }

  Map<String, String> getDefaultHeaders() {
    return {
      "Authorization": "Bearer $TOKEN"
    };
  }
}