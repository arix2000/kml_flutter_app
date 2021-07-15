import 'package:http/http.dart';

class ServerException implements Exception {
  ServerException(Response response) {
    print("${response.statusCode}: ${response.body}");
  }
}

class CacheException implements Exception {}

class InternetConnectionException implements Exception {}