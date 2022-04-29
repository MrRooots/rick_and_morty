import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure({required final String errorMessage})
      : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required final String errorMessage})
      : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UndefinedFailure extends Failure {
  const UndefinedFailure({required final String errorMessage})
      : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
