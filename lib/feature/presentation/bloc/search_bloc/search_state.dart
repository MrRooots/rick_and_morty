part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchSuccessful extends SearchState {
  final List<CharacterEntity> characters;

  const SearchSuccessful({required final this.characters});

  @override
  List<Object> get props => [characters];
}

class SearchFailed extends SearchState {
  final String errorMessage;

  const SearchFailed({required final this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
