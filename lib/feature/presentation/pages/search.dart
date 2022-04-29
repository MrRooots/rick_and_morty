import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/palette/palette.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/widgets/character_card.dart';
import 'package:rick_and_morty/feature/presentation/widgets/components/loading_Indicator.dart';
import 'package:rick_and_morty/feature/presentation/widgets/components/my_divider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
          splashRadius: .1,
        ),
        centerTitle: true,
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');

  static const List<String> _suggestions = [
    'Rick',
    'Morty',
    'Summer',
    'Beth',
    'Jerry',
    'Calypso',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.close_rounded),
        splashRadius: .1,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        color: Palette.black,
        size: 18.0,
      ),
      splashRadius: .1,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchBloc>(context)
        .add(SearchCharactersEvent(characterQuery: query));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const LoadingIndicator();
        } else if (state is SearchFailed) {
          return Text(state.errorMessage);
        } else if (state is SearchSuccessful) {
          return ListView.builder(
            itemCount: state.characters.length,
            itemBuilder: (BuildContext context, int index) {
              return CharacterCard(character: state.characters[index]);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return Container();
    }
    return ListView.separated(
      itemCount: _suggestions.length,
      separatorBuilder: (BuildContext context, int index) {
        return const MyDivider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Text(_suggestions[index]);
      },
    );
  }
}
