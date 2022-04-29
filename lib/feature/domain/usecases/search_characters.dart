import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/data/usecase.dart';
import 'package:rick_and_morty/core/failures/failures.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/character_repository.dart';

class SearchCharactersParams {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  const SearchCharactersParams({
    required final this.name,
    final this.status,
    final this.species,
    final this.type,
    final this.gender,
  });

  Map<String, String?> get values => {
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
      };

  Map<String, String> get query {
    final Map<String, String> query = {};

    for (final MapEntry<String, String?> entry in values.entries) {
      if (entry.value != null) {
        query.addAll({entry.key: entry.value!});
      }
    }

    return query;
  }
}

class SearchCharacters
    implements UseCase<List<CharacterEntity>, SearchCharactersParams> {
  final CharacterRepository repository;

  const SearchCharacters({required final this.repository});

  @override
  Future<Either<List<CharacterEntity>, Failure>> call(
    final SearchCharactersParams params,
  ) async {
    return await repository.searchCharacters(query: params.query);
  }
}
