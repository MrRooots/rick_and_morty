import 'package:rick_and_morty/core/failures/exceptions.dart';
import 'package:rick_and_morty/core/services/network_info.dart';
import 'package:rick_and_morty/feature/data/datasources/local_data_source.dart';
import 'package:rick_and_morty/feature/data/datasources/remote_data_source.dart';
import 'package:rick_and_morty/feature/data/models/character_model.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/feature/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const CharacterRepositoryImpl({
    required final this.remoteDataSource,
    required final this.localDataSource,
    required final this.networkInfo,
  });

  @override
  Future<Either<List<CharacterEntity>, Failure>> getAllCharacters({
    required final int page,
  }) async {
    return await _makeRequest(
      function: () => remoteDataSource.getAllCharacters(page: page),
    );
  }

  @override
  Future<Either<List<CharacterEntity>, Failure>> searchCharacters({
    required final Map<String, String> query,
  }) async {
    return await _makeRequest(
        function: () => remoteDataSource.searchCharacters(query: query));
  }

  Future<Either<List<CharacterEntity>, Failure>> _makeRequest({
    required final Future<List<CharacterModel>> Function() function,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<CharacterModel> characters = await function();

        await localDataSource.saveToCache(characters: characters);

        return left(characters);
      } on ServerException catch (e) {
        return right(ServerFailure(errorMessage: e.errorMessage));
      } catch (e) {
        return right(UndefinedFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final List<CharacterModel> characters =
            await localDataSource.getFromCache();

        return left(characters);
      } on CacheException catch (e) {
        return right(CacheFailure(errorMessage: e.errorMessage));
      } catch (e) {
        return right(UndefinedFailure(errorMessage: e.toString()));
      }
    }
  }
}
