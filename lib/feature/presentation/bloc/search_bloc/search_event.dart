part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchCharactersEvent extends SearchEvent {
  final String characterQuery;

  const SearchCharactersEvent({required final this.characterQuery});

  @override
  List<Object> get props => [characterQuery];
}
