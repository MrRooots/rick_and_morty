import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Type, Failure>> call(Params params);
}
