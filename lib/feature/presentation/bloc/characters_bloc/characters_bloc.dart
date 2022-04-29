import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/failures/failures.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetAllCharacters getAllCharacters;
  int page = 1;

  CharactersBloc({required final this.getAllCharacters})
      : super(const CharactersEmpty()) {
    on<CharactersFetching>(_onFetching);
  }

  Future<void> _onFetching(
    CharactersFetching event,
    Emitter<CharactersState> emit,
  ) async {
    if (state is CharactersLoading) {
      return;
    }

    List<CharacterEntity> oldCharacters = [];

    if (state is CharactersSuccessful) {
      oldCharacters = (state as CharactersSuccessful).characters;
    }

    emit(
      CharactersLoading(oldCharacters: oldCharacters, isFirstFetch: page == 1),
    );

    final failureOrCharacters =
        await getAllCharacters(GetAllCharactersParams(page: page));

    failureOrCharacters.fold(
      (final List<CharacterEntity> characters) {
        page++;

        emit(CharactersSuccessful(characters: [
          ...oldCharacters,
          ...characters,
        ]));
      },
      (final Failure failure) =>
          emit(CharactersFailed(errorMessage: failure.errorMessage)),
    );
  }
}
