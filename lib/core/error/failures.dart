import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  static const SERVER_FAILURE_MESSAGE = "Server failure";
  static const INTERNET_CONNECTION_FAILURE_MESSAGE = "Internet connection failure";
  static const CACHE_FAILURE_MESSAGE = "Cache failure";

  final List properties = const [];
  Failure([properties]);

  @override
  List<Object> get props => [properties];

  String getErrorMessage() {
    switch(this.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InternetConnectionFailure:
        return INTERNET_CONNECTION_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}

//General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InternetConnectionFailure extends Failure {}