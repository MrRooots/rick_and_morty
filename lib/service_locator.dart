import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:rick_and_morty/core/services/network_info.dart';

import 'package:rick_and_morty/feature/data/datasources/local_data_source.dart';
import 'package:rick_and_morty/feature/data/datasources/remote_data_source.dart';
import 'package:rick_and_morty/feature/data/repositories/character_repository_impl.dart';

import 'package:rick_and_morty/feature/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_characters.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_characters.dart';

import 'package:rick_and_morty/feature/presentation/bloc/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initialize() async {
  // Blocs
  sl.registerFactory(() => SearchBloc(searchCharacters: sl()));
  sl.registerFactory(() => CharactersBloc(getAllCharacters: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetAllCharacters(repository: sl()));
  sl.registerLazySingleton(() => SearchCharacters(repository: sl()));

  // Repositories
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(networkInfo: sl(), client: sl()));

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(storage: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(checker: sl()));

  final SharedPreferences storage = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => storage);
  sl.registerLazySingleton(() => http.Client());
}
