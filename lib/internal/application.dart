import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/palette/palette.dart';
import 'package:rick_and_morty/feature/presentation/bloc/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/pages/home.dart';
import 'package:rick_and_morty/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<CharactersBloc>()..add(const CharactersFetching()),
        ),
        BlocProvider(create: (context) => sl<SearchBloc>()),
      ],
      child: MaterialApp(
        theme: Palette.theme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
