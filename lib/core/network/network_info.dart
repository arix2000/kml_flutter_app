import 'package:data_connection_checker/data_connection_checker.dart';

const API_URL = 'http://sobos.ssd-linuxpl.com/KmlApi5/';
const CONTENT_TYPE_KEY = 'Content-Type';
const CONTENT_TYPE_VALUE = 'application/json';
const SUCCESSFUL_STATUS_CODE = 200;
const DEFAULT_ENCODING = "utf-8";
const TOKEN = "9sk01mx023sdaj234oa19z2dz8zacxvm0d087d";

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}