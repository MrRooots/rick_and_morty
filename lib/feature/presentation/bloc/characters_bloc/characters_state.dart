part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersEmpty extends CharactersState {
  const CharactersEmpty();
}

class CharactersLoading extends CharactersState {
  final bool isFirstFetch;
  final List<CharacterEntity> oldCharacters;

  const CharactersLoading({
    final this.isFirstFetch = false,
    required final this.oldCharacters,
  });

  @override
  List<Object> get props => [isFirstFetch, oldCharacters];
}

class CharactersSuccessful extends CharactersState {
  final List<CharacterEntity> characters;

  const CharactersSuccessful({required final this.characters});

  @override
  List<Object> get props => [characters];
}

class CharactersFailed extends CharactersState {
  final String errorMessage;

  const CharactersFailed({required final this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
