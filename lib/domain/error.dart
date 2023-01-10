abstract class DomainError implements Exception {
  final String? message;
  final Exception? cause;

  const DomainError({this.message, this.cause});

  @override
  String toString() => "message: $message, cause $cause";
}

class LogicError implements DomainError {
  @override
  final String? message;
  @override
  final Exception? cause;

  const LogicError({this.message, this.cause});
}

class StorageError implements DomainError {
  @override
  final String? message;
  @override
  final Exception? cause;

  const StorageError({this.message, this.cause});
}

class NetworkError implements DomainError {
  @override
  final String? message;
  @override
  final Exception? cause;

  const NetworkError({this.message, this.cause});
}

class UnknownError implements DomainError {
  @override
  final String? message;
  @override
  final Exception? cause;

  const UnknownError({this.message, this.cause});
}
