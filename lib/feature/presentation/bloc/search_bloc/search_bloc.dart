import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/failures/failures.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_characters.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchCharacters searchCharacters;

  SearchBloc({required final this.searchCharacters})
      : super(const SearchInitial()) {
    on<SearchCharactersEvent>(_onSearch);
  }

  Future<void> _onSearch(
    SearchCharactersEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());

    final failureOrCharacters = await searchCharacters(
      SearchCharactersParams(name: event.characterQuery),
    );

    failureOrCharacters.fold(
      (final List<CharacterEntity> characters) => emit(
        SearchSuccessful(characters: characters),
      ),
      (final Failure failure) => emit(SearchFailed(
        errorMessage: failure.errorMessage,
      )),
    );
  }
}
