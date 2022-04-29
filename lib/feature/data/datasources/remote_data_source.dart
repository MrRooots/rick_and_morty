import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/constants/base.dart';

import 'package:rick_and_morty/core/constants/urls.dart';
import 'package:rick_and_morty/core/failures/exceptions.dart';
import 'package:rick_and_morty/core/services/network_info.dart';
import 'package:rick_and_morty/feature/data/models/character_model.dart';

abstract class RemoteDataSource {
  /// Makes GET request to [Urls.characters] endpoint
  ///
  /// Throws [ServerException]
  Future<List<CharacterModel>> getAllCharacters({required final int page});

  /// Makes GET request to [Urls.characters] endpoint
  ///
  /// Throws [ServerException]
  Future<List<CharacterModel>> searchCharacters({
    required final Map<String, String> query,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkInfo networkInfo;
  final http.Client client;

  const RemoteDataSourceImpl({
    required final this.networkInfo,
    required final this.client,
  });

  @override
  Future<List<CharacterModel>> getAllCharacters({
    required final int page,
  }) async {
    return await _makeRequest(
      url: Uri.parse(Urls.characters).replace(
        queryParameters: {'page': page.toString()},
      ),
    );
  }

  @override
  Future<List<CharacterModel>> searchCharacters({
    required final Map<String, String> query,
  }) async {
    return await _makeRequest(
      url: Uri.parse(Urls.characters).replace(
        queryParameters: query,
      ),
    );
  }

  Future<List<CharacterModel>> _makeRequest({required final Uri url}) async {
    final http.Response response =
        await client.get(url, headers: Base.contentType);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> responseJson = json.decode(response.body);

        return (responseJson['results'] as List)
            .map((json) => CharacterModel.fromJson(json: json))
            .toList();
      } else {
        throw ServerException(errorMessage: 'Invalid server response!');
      }
    } else if (response.statusCode == 404) {
      throw ServerException(errorMessage: 'Nothing found!');
    } else {
      throw ServerException(errorMessage: 'Server failure!');
    }
  }
}
