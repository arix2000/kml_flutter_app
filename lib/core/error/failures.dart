import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const [];
  Failure([properties]);

  @override
  List<Object> get props => [properties];

  String getErrorMessage() {
    switch(this.runtimeType) {
      case ServerFailure:
        return 'SERVER_FAILURE_MESSAGE';
      case InternetConnectionFailure:
        return 'INTERNET_CONNECTION_FAILURE_MESSAGE';
      case CacheFailure:
        return 'CACHE_FAILURE_MESSAGE';
      default:
        return 'Unexpected Error';
    }
  }
}

//General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InternetConnectionFailure extends Failure {}