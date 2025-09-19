abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class ServerFailue extends Failure {
  ServerFailue({required super.message});
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required super.message});
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({required super.message});
}