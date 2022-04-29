import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/failures/failures.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';

/// Character repository interface definition
abstract class CharacterRepository {
  Future<Either<List<CharacterEntity>, Failure>> getAllCharacters({
    required final int page,
  });

  Future<Either<List<CharacterEntity>, Failure>> searchCharacters({
    required final Map<String, String> query,
  });
}
