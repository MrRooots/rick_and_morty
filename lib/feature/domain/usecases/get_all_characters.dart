import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/data/usecase.dart';
import 'package:rick_and_morty/core/failures/failures.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/character_repository.dart';

class GetAllCharactersParams {
  final int page;

  const GetAllCharactersParams({required final this.page});
}

class GetAllCharacters
    implements UseCase<List<CharacterEntity>, GetAllCharactersParams> {
  final CharacterRepository repository;

  const GetAllCharacters({required final this.repository});

  @override
  Future<Either<List<CharacterEntity>, Failure>> call(
    final GetAllCharactersParams params,
  ) async {
    return await repository.getAllCharacters(page: params.page);
  }
}
