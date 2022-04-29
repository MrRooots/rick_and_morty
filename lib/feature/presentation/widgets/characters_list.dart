import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/palette/palette.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/presentation/bloc/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/presentation/widgets/character_card.dart';
import 'package:rick_and_morty/feature/presentation/widgets/loading_Indicator.dart';
import 'package:rick_and_morty/feature/presentation/widgets/my_divider.dart';

class CharactersList extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  CharactersList({Key? key}) : super(key: key);

  void _initializeScrollController(final BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          BlocProvider.of<CharactersBloc>(context).add(
            const CharactersFetching(),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _initializeScrollController(context);

    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        bool _isLoading = false;
        List<CharacterEntity> _characters = [];

        if (state is CharactersLoading && state.isFirstFetch) {
          return const LoadingIndicator();
        } else if (state is CharactersLoading) {
          _characters = state.oldCharacters;
          _isLoading = true;
        } else if (state is CharactersFailed) {
          return Center(child: Text(state.errorMessage));
        } else if (state is CharactersSuccessful) {
          _characters.addAll(state.characters);
        } else {
          return const Text('This shouldn\'t have happened');
        }

        return ListView.separated(
          controller: _scrollController,
          itemCount: _characters.length + (_isLoading ? 1 : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index < _characters.length) {
              return CharacterCard(character: _characters[index]);
            } else {
              Timer(
                const Duration(milliseconds: 50),
                () => _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent),
              );
              return const LoadingIndicator();
            }
          },
          separatorBuilder: (context, index) => const MyDivider(),
        );
      },
    );
  }
}
