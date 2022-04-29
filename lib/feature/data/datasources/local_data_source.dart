import 'dart:convert';

import 'package:rick_and_morty/core/constants/base.dart';
import 'package:rick_and_morty/core/failures/exceptions.dart';
import 'package:rick_and_morty/feature/data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  /// Trying to load list of cached characters from local storage
  ///
  /// Throws [CacheException]
  Future<List<CharacterModel>> getFromCache();

  /// Trying to save list of characters into local storage
  ///
  /// Throws [CacheException]
  Future<void> saveToCache({required final List<CharacterModel> characters});
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences storage;

  const LocalDataSourceImpl({required final this.storage});

  @override
  Future<List<CharacterModel>> getFromCache() async {
    final List<String>? cachedCharacters =
        storage.getStringList(Base.cachedCharacters);

    if (cachedCharacters != null && cachedCharacters.isNotEmpty) {
      return cachedCharacters
          .map((final String jsonString) =>
              CharacterModel.fromJson(json: json.decode(jsonString)))
          .toList();
    } else {
      throw CacheException(errorMessage: 'Cache is empty!');
    }
  }

  @override
  Future<void> saveToCache({
    required final List<CharacterModel> characters,
  }) async {
    await storage.setStringList(
      Base.cachedCharacters,
      characters
          .map((final CharacterModel character) =>
              json.encode(character.toJson()))
          .toList(),
    );
  }
}
